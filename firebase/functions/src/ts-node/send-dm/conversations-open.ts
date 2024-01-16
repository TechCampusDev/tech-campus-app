import axios from 'axios'
import { SendDmConfirmedUser } from './types'

// DMがopenしていない場合はDMをopenする
export const conversationsOpen = async (
  users: SendDmConfirmedUser[],
  slackToken: string
) => {
  try {
    for (const user of users) {
      await axios.post(
        'https://slack.com/api/conversations.open',
        {
          users: user.id,
        },
        {
          headers: {
            Authorization: `Bearer ${slackToken}`,
          },
        }
      )
    }
  } catch (error) {
    console.log(error)
  }
}
