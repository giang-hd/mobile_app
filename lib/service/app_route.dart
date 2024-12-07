
part of 'app_page.dart';

abstract class AppRoutes {
  AppRoutes._();
  static const SPLASH =_Paths.SPLASH;
  static const MAIN =_Paths.MAIN;
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const ACCOUNT = _Paths.ACCOUNT;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const MAIN = '/main';
  static const LOGIN = '/login';
  static const HOME = '/dashboard';
  static const ACCOUNT = '/account';
}