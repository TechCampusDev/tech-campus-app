import axios from 'axios'
import { getFirestore } from 'firebase-admin/firestore'
import { getDownloadURL, getStorage } from 'firebase-admin/storage'
import * as functions from 'firebase-functions'
import { sendSlackMessage } from '../../utils/send-slack-message'

// 特定のチャンネルのメッセージをアーカイブする（GASからhttpリクエストで呼ばれる）
export const onRequestArchiveSlackMessage = functions
  .region('asia-northeast1')
  .https.onRequest(async (request, response) => {
    const method = request.method
    if (method !== 'POST') {
      response.status(405).send('Method Not Allowed')
      sendSlackMessage('不正なリクエストがありました: Method Not Allowed')
      return
    }
    const idToken = request.headers.authorization?.split('Bearer ')[1]
    if (idToken !== functions.config().tech_campus.on_request_key) {
      response.status(401).send('Unauthorized')
      sendSlackMessage('不正なリクエストがありました: Unauthorized')
      return
    }

    const { ts, channel } = request.body

    // チャンネルの制限
    const archiveChannelsString = functions.config().slack.archive_channels
    if (!archiveChannelsString.includes(channel)) {
      response.status(400).send(`Bad Request (channel: ${channel})`)
      sendSlackMessage(
        `不正なリクエストがありました: Bad Request (channel: ${channel})`
      )
      return
    }

    try {
      const message = await retrieveMessage(channel, ts)

      const { client_msg_id: messageId } = message

      await getFirestore()
        .collection('slackArchives')
        .doc('v1')
        .collection(channel)
        .doc(messageId)
        .set(message)

      await archiveFiles(messageId, channel)

      const text = message.text ?? 'メッセージなし'

      sendSlackMessage(
        '以下のメッセージのアーカイブに成功しました:\n' + text.substring(0, 10)
      )

      response.send('success')
    } catch (e) {
      console.error(e)
      sendSlackMessage(e?.toString() ?? '')
      response.status(500).send('Internal Server Error')
    }
  })

const retrieveMessage = async (channel: string, ts: string) => {
  const response = await axios.get(
    'https://slack.com/api/conversations.history' +
      `?channel=${channel}&latest=${ts}&limit=1&inclusive=true`,
    {
      headers: {
        Authorization: `Bearer ${functions.config().slack.bot_token}`,
      },
    }
  )

  return response.data.messages[0]
}

const archiveFiles = async (messageId: string, channel: string) => {
  const ref = getFirestore()
    .collection('slackArchives')
    .doc('v1')
    .collection(channel)
    .doc(messageId)

  const snapshot = await ref.get()
  const message = snapshot.data()

  let files = message?.files
  if (!files) {
    return
  }

  const slackToken = functions.config().slack.bot_token
  const projectId = process.env.GCLOUD_PROJECT
  const bucket = `${projectId}.appspot.com`

  for (const file of files) {
    const {
      url_private_download: url,
      filetype,
      id: fileId,
      thumb_video: thumbnail,
    } = file
    console.log(url, filetype, thumbnail)

    if (
      filetype === 'png' ||
      filetype === 'jpg' ||
      filetype === 'jpeg' ||
      filetype === 'gif' ||
      filetype === 'mp4' ||
      filetype === 'mov'
    ) {
      const response = await axios.get(url, {
        headers: {
          Authorization: `Bearer ${slackToken}`,
        },
        responseType: 'arraybuffer',
      })

      const buffer = Buffer.from(response.data, 'binary')

      const pathToFile = `slackChannels/${channel}/${fileId}.${filetype}`

      const ref = getStorage().bucket(bucket).file(pathToFile)

      await ref.save(buffer)

      const downloadedUrl = await getDownloadURL(ref)

      console.log(downloadedUrl)

      files = files.map((f: { id: string }) => {
        if (f.id === fileId) {
          return {
            ...f,
            url_storage_download: downloadedUrl,
          }
        }
        return f
      })

      await snapshot.ref.update({
        files: files,
      })

      if (thumbnail) {
        const response2 = await axios.get(thumbnail, {
          headers: {
            Authorization: `Bearer ${slackToken}`,
          },
          responseType: 'arraybuffer',
        })

        const buffer2 = Buffer.from(response2.data, 'binary')
        const pathToFile2 = `slackChannels/${channel}/${fileId}.jpeg`

        const ref2 = getStorage().bucket(bucket).file(pathToFile2)
        await ref2.save(buffer2)

        const downloadedUrl2 = await getDownloadURL(ref2)

        files = files.map((f: { id: string }) => {
          if (f.id === fileId) {
            return {
              ...f,
              url_storage_thumbnail: downloadedUrl2,
            }
          }
          return f
        })

        await snapshot.ref.update({
          files: files,
        })
      }
    }
  }
}
