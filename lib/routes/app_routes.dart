part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const DETAIL = _Paths.DETAIL;
}

abstract class _Paths {
  _Paths._();

  static const LOGIN = '/login';
  static const HOME = '/home';
  static const DETAIL = '/detail';
}
