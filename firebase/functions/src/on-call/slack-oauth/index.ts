import { OnCallSlackOauthRequest } from '@/types/on-call-slack-oauth-request'
import * as functions from 'firebase-functions'
import axios from 'axios'
import { jwtDecode } from 'jwt-decode'
import { getAuth } from 'firebase-admin/auth'

export const onCallSlackOauth = functions
  .region('asia-northeast1')
  .https.onCall(async (data) => {
    const request = data as OnCallSlackOauthRequest
    const { code, from } = request

    console.log(code)
    console.log(from)

    const response = await axios.post(
      'https://slack.com/api/openid.connect.token',
      {
        code: code,
        client_id: functions.config().slack.client_id,
        client_secret: functions.config().slack.client_secret,
        redirect_uri: functions.config().slack.redirect_uri + '?from=' + from,
      },
      {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      }
    )

    console.log(response.data)

    const { id_token: idToken } = response.data
    const decoded = jwtDecode(idToken)

    console.log(decoded)

    const { sub: userId } = decoded

    if (!userId) {
      throw new functions.https.HttpsError(
        'internal',
        'SlackのユーザーIDが取得できませんでした'
      )
    }

    const customToken = await getAuth().createCustomToken(userId)

    return { customToken }
  })
