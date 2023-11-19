import { OnCallSlackOauthRequest } from '@/types/on-call-slack-oauth-request'
import * as functions from 'firebase-functions'
import axios from 'axios'

export const onCallSlackOauth = functions
  .region('asia-northeast1')
  .https.onCall(async (data) => {
    const request = data as OnCallSlackOauthRequest
    const { code } = request

    console.log(code)

    const response = await axios.post(
      'https://slack.com/api/openid.connect.token',
      {
        code: code,
        client_id: functions.config().slack.client_id,
        client_secret: functions.config().slack.client_secret,
        redirect_uri: functions.config().slack.redirect_uri,
      },
      {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      }
    )

    console.log(response.data)

    return response.data
  })
