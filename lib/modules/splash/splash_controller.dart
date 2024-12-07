import 'package:get/get.dart';
import 'package:mobile_app/service/app_page.dart';
import 'package:mobile_app/service/token_managerment.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    print("object");
    super.onInit();
  }

  void navigateToNextScreen() async {
    String? token = await TokenManager.getAccessToken();
    if (token != null && token.isNotEmpty) {
      Get.offAndToNamed(AppRoutes.HOME);
    } else {
      Get.offAndToNamed(AppRoutes.LOGIN);
    }
  }

  // @override
  // void onClose() {
  //   Get.delete<SplashController>();
  //   super.onClose();
  // }
}
