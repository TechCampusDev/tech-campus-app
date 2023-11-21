class Routes {
  const Routes._();

  static const String index = '/';
  static const String oauth = '/oauth';

  static String event({String? id}) =>
      id == null ? '/events/:id' : '/events/$id';
}
