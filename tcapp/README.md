# pullしたら

```
fvm use 3.13.2
flutter pub run build_runner build --delete-conflicting-outputs
```

# アプリの起動

```
flutter run -d Chrome --web-renderer canvaskit
```

# アプリのデプロイ

```
flutter build web --web-renderer canvaskit
firebase deploy --only hosting
```
