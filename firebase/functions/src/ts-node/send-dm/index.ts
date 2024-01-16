import axios from 'axios'
import * as dotenv from 'dotenv'
import { getConfirmedUsers } from './get-confirmed-users'
import { getConfirmedUsersChannels } from './get-confirmed-users-channels'
import { conversationsOpen } from './conversations-open'
dotenv.config()

const tsNodeSendDm = async () => {
  const isUserToken = true
  const isNeedConversationOpen = false

  const slackToken = isUserToken
    ? process.env.SLACK_USER_TOKEN
    : process.env.SLACK_BOT_TOKEN
  if (!slackToken) return

  const users = await getConfirmedUsers()
  if (isNeedConversationOpen) {
    await conversationsOpen(users, slackToken)
  }
  const channles = await getConfirmedUsersChannels(users, slackToken)

  // console.log(users.length)
  // console.log(channles.length)

  // return

  for (const channel of channles) {
    try {
      // DMメッセージ送信
      await axios.post(
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

// trueにすると実行される
const RUN_TS_NODE_SEND_DM = false

if (RUN_TS_NODE_SEND_DM) {
  tsNodeSendDm()
}
