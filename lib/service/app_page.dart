import 'package:get/get.dart';
import 'package:mobile_app/modules/home/home_binding.dart';
import 'package:mobile_app/modules/login/login_binding.dart';
import 'package:mobile_app/modules/splash/splash_binding.dart';
import 'package:mobile_app/modules/splash/splash_view.dart';
import 'package:mobile_app/modules/home/home_view.dart';
import 'package:mobile_app/modules/login/login_view.dart';

part 'app_route.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
        name: _Paths.SPLASH,
        page: () => const SplashView(),
        binding: SplashBinding()),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
