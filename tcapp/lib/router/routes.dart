class Routes {
  const Routes._();

  static const String index = '/';
  static const String oauth = '/oauth';

  static String event({String? eventId}) =>
      eventId == null ? '/events/:eventId' : '/events/$eventId';
}
