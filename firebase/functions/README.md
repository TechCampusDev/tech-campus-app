# はじめに
- Node: v18.12.1

```
npm run install
```

# デプロイ

```
firebase deploy --only functions:{関数名}
```

# 手動実行するバッチ処理
手動実行するバッチ処理は `src/ts-node` 配下にコードを残している。

### 必要なリソース
- Slack関連の処理: `.env`
  - `.env.example` を参考に
- Firebase関連の処理: `firebase-adminsdk.json` （FirebaseAdminSDKサービスアカウント）
  - `src/firebase.ts` 内の `initializeApp` をserviceAccountを使用したものに置き換える。

### 実行
```
./node_modules/.bin/ts-node src/xxx.ts
```
