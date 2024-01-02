export interface SendDmConfirmedUser {
  id: string
  name: string
  confirmed: boolean
}

export interface SendDmChannel {
  channel: string
  userId: string
  name: string
  created: number
}
