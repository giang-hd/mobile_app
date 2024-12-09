import 'package:get/get.dart';
import 'package:mobile_app/modules/account/account_binding.dart';
import 'package:mobile_app/modules/account/account_view.dart';
import 'package:mobile_app/modules/account/change_pass/change_pass_view.dart';
import 'package:mobile_app/modules/home/home_binding.dart';
import 'package:mobile_app/modules/login/login_binding.dart';
import 'package:mobile_app/modules/main/main_binding.dart';
import 'package:mobile_app/modules/main/main_view.dart';
import 'package:mobile_app/modules/splash/splash_binding.dart';
import 'package:mobile_app/modules/splash/splash_view.dart';
import 'package:mobile_app/modules/home/home_view.dart';
import 'package:mobile_app/modules/login/login_view.dart';

part 'app_route.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
        name: _Paths.MAIN,
        page: () => const MainPage(),
        binding: MainBinding()),
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
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEPASS,
      page: () => const ChangePassView(),
      binding: AccountBinding(),
    ),
  ];
}
