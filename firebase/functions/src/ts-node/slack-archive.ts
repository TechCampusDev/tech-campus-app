import axios from 'axios'
import * as dotenv from 'dotenv'
import { getFirestore } from 'firebase-admin/firestore'
import { getInstallations } from 'firebase-admin/installations'
import { initializeFirebaseAdmin } from '../firebase'
import { getStorage, getDownloadURL } from 'firebase-admin/storage'
dotenv.config()

// onRequestArchiveSlackMessageで漏れた時や新規にアーカイブするチャンネルを追加した時用の機能

// 特定のチャンネルのメッセージを全て取得してFirestoreに保存する
const archiveToSlack = async () => {
  const channel = process.env.ARCHIVE_CHANNEL_ID as string
  const slackToken = process.env.SLACK_BOT_TOKEN as string

  const response = await axios.get(
    `https://slack.com/api/conversations.history?channel=${channel}`,
    {
      headers: {
        Authorization: `Bearer ${slackToken}`,
      },
    }
  )

  console.log(response.data)

  const { messages } = response.data

  for (const message of messages) {
    console.log(message)
    const messageId = message.client_msg_id
    if (messageId) {
      await getFirestore()
        .collection('slackArchives')
        .doc('v1')
        .collection(channel)
        .doc(messageId)
        .set(message)
    }
  }
}

// Firestoreに保存された特定のチャンネルのメッセージを全て取得してそれらのファイルをStorageに保存し、そのURLをFirestoreに保存する
const archiveMessageFiles = async () => {
  const channel = process.env.ARCHIVE_CHANNEL_ID as string
  const slackToken = process.env.SLACK_BOT_TOKEN as string
  const projectId = getInstallations().app.options.projectId
  const bucket = `${projectId}.appspot.com`

  const snapshots = await getFirestore()
    .collection('slackArchives')
    .doc('v1')
    .collection(channel)
    .get()

  for (const snapshot of snapshots.docs) {
    // if (snapshot.id !== 'xxxxxxxxx') continue // 特定のメッセージのみアーカイブする場合
    const data = snapshot.data()
    let files = data.files
    if (!files) {
      continue
    }
    for (const file of files) {
      const {
        url_private_download: url,
        filetype,
        id: fileId,
        thumb_video: thumbnail,
      } = file
      console.log(url, filetype, thumbnail)

      try {
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
      } catch (error) {
        console.log(error)
      }
    }
  }
}

const RUN_ARCHIVE_TO_SLACK = false
const RUN_ARCHIVE_MESSAGE_FILES = true

initializeFirebaseAdmin()

if (RUN_ARCHIVE_TO_SLACK) {
  archiveToSlack()
}
if (RUN_ARCHIVE_MESSAGE_FILES) {
  archiveMessageFiles()
}
