
part of 'app_page.dart';

abstract class AppRoutes {
  AppRoutes._();
  static const SPLASH =_Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const HOME = '/dashboard';
}