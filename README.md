# TechCampusApp
https://app.techcampus.dev/

TechCampusメンバー向けのWebアプリです。TechCampusのSlackでログインすると限定公開のコンテンツも表示されます。

# ディレクトリ構成

- tcapp: メインのアプリ（Flutter）
- firebase/functions: FirebaseFunctions（Node.js）

# tcappの動かし方

[こちら](https://github.com/TechCampusDev/tcapp/blob/main/tcapp/lib/env/env.dart) に記載のキー情報が含まれた `.env` ファイルを `tcapp/.env` に配置し、 `tcapp` ディレクトリ内で下記コマンドを実行してください。

```
flutter pub run build_runner build --delete-conflicting-outputs
```
