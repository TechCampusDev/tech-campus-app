import * as admin from 'firebase-admin'

export const initializeFirebaseAdmin = (): void => {
  admin.initializeApp()
}
