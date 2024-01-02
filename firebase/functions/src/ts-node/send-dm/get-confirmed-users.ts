import axios from 'axios'
import { SendDmConfirmedUser } from './types'

export const getConfirmedUsers = async () => {
  const slackToken = process.env.SLACK_APP_USER_TOKEN

  const userResponse = await axios.get('https://slack.com/api/users.list', {
    headers: {
      Authorization: `Bearer ${slackToken}`,
    },
  })

  console.log(userResponse.data.members)

  const members: SendDmConfirmedUser[] = userResponse.data.members.map(
    (member: {
      id: string
      name: string
      profile: {
        display_name: string
      }
      is_email_confirmed: boolean
    }) => {
      const { id, name, profile, is_email_confirmed: confirmed } = member
      const userName =
        !profile || profile?.display_name === '' ? name : profile.display_name

      return {
        id,
        name: userName,
        confirmed,
      }
    }
  )

  const confirmedMembers = members.filter((member) => {
    return member.confirmed
  })

  console.log(confirmedMembers)

  return confirmedMembers
}
