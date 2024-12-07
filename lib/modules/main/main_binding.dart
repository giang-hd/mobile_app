

// app_binding.dart
import 'package:get/get.dart';
import 'package:mobile_app/modules/account/account_controller.dart';
import 'package:mobile_app/modules/home/home_controller.dart';
import 'package:mobile_app/modules/main/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
  }
}