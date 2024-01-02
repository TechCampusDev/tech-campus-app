import axios from 'axios'
import * as dotenv from 'dotenv'
import { getConfirmedUsers } from './get-confirmed-users'
import { getConfirmedUsersChannels } from './get-confirmed-users-channels'
dotenv.config()

const tsNodeSendDm = async () => {
  const slackToken = process.env.SLACK_APP_USER_TOKEN

  const users = await getConfirmedUsers()
  const channles = await getConfirmedUsersChannels(users)

  console.log(channles.length)

  for (const channel of channles) {
    try {
      // DMメッセージ送信
      axios.post(
        'https://slack.com/api/chat.postMessage',
        {
          channel: channel.channel,
          text: 'DMメッセージの内容',
        },
        {
          headers: {
            Authorization: `Bearer ${slackToken}`,
          },
        }
      )
    } catch (error) {
      console.log(error)
    }
  }
}

const RUN_TS_NODE_SEND_DM = false

if (RUN_TS_NODE_SEND_DM) {
  tsNodeSendDm()
}
