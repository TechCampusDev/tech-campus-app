import 'package:flutter/foundation.dart';

const kAppUrl =
    kReleaseMode ? 'https://app.techcampus.dev' : 'http://localhost:5555';

const kSlackRedirectUri =
    kReleaseMode ? '$kAppUrl/oauth' : 'https://redirectmeto.com/$kAppUrl/oauth';
