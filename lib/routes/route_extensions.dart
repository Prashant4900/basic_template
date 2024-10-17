part of 'routers.dart';

extension RouteExtensions on BuildContext {
  void pushAndRemoveAll(String route, {Object? extra}) {
    if (canPop()) {
      pop();
    }

    push(route, extra: extra);
  }
}
