import * as functions from 'firebase-functions'
import axios from 'axios'

export const sendSlackMessage = async (message: string, channel?: string) => {
  const response = await axios.post(
    'https://slack.com/api/chat.postMessage',
    {
      channel: channel || '#bot_log',
      text: message,
    },
    {
      headers: {
        Authorization: `Bearer ${functions.config().slack.bot_token}`,
      },
    }
  )

  console.log(response.data)
}
