import axios from 'axios'
import { SendDmChannel, SendDmConfirmedUser } from './types'

export const getConfirmedUsersChannels = async (
  users: SendDmConfirmedUser[],
  slackToken: string
) => {
  const dmResponse = await axios.get(
    'https://slack.com/api/conversations.list?types=im',
    {
      headers: {
        Authorization: `Bearer ${slackToken}`,
      },
    }
  )

  const channels = dmResponse.data.channels

  const dmChannels: SendDmChannel[] = []
  for (const channel of channels) {
    const { id, user: channelUserId, created } = channel
    const user = users.find((user) => user.id === channelUserId)
    if (user) {
      dmChannels.push({
        channel: id,
        userId: channelUserId,
        name: user.name,
        created,
      })
    }
  }

  console.log(dmChannels)

  return dmChannels

  // 1ヶ月以上経過したチャンネルのみにする
  const overMonthDmChannels = dmChannels.filter((channel) => {
    const now = new Date()
    const created = new Date(channel.created * 1000)
    const diff = now.getTime() - created.getTime()
    const diffDays = diff / (1000 * 60 * 60 * 24)
    return diffDays > 30
  })

  console.log(overMonthDmChannels)

  return overMonthDmChannels
}
