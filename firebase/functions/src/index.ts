import { initializeFirebaseAdmin } from './firebase'

initializeFirebaseAdmin()

export { onCallSlackOauth } from './on-call/slack-oauth'
export { onRequestArchiveSlackMessage } from './on-request/archive-slack-message'
