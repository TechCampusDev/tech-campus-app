import * as admin from 'firebase-admin'
// import * as serviceAccount from '../techcampus-firebase-adminsdk.json'

export const initializeFirebaseAdmin = (): void => {
  admin.initializeApp()
  // admin.initializeApp({
  //   credential: admin.credential.cert({
  //     projectId: serviceAccount.project_id,
  //     clientEmail: serviceAccount.client_email,
  //     privateKey: serviceAccount.private_key,
  //   }),
  // })
}
