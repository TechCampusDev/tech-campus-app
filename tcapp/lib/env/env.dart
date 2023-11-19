import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'SLACK_CLIENT_ID', obfuscate: true)
  static String slackClientId = _Env.slackClientId;
  @EnviedField(varName: 'SLACK_CLIENT_SECRET', obfuscate: true)
  static String slackClientSecret = _Env.slackClientSecret;
}
