import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/service/app_page.dart';

import '../../service/token_managerment.dart';
import '../home/home_view.dart';

class LoginController extends GetxController {
  final BaseApiService _apiService = BaseApiService();

  final emailController = TextEditingController(text: "odeyiang303@gmail.com");
  final passwordController = TextEditingController(text: "123456");
  final nameController = TextEditingController();

  RxBool isLogin = true.obs;
  RxBool isValue = false.obs;
  RxBool rememberMe = false.obs;
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();
  @override
  void onInit() {
    print("Noob");
    super.onInit();
  }
  void toggleAuthMode() {
    isLogin.toggle();
  }

  void forgotPassword() {
    Get.snackbar('Thông báo', 'Kiểm tra email để đặt lại mật khẩu');
  }

  Future<void> submit() async {
    // Kiểm tra xem email và mật khẩu có trống không
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      isValue.value = true;
      error.value = 'Vui lòng nhập đầy đủ email và mật khẩu';
      return;
    }

    isValue.value = false;
    isLoading.value = true;
    error.value = null;

    try {
      final response = await _apiService.post('/login', data: {
        'username': emailController.text.trim(),
        'password': passwordController.text.trim(),
      });
      await TokenManager.saveAccessToken(response['accessToken']);
      await TokenManager.saveRefreshToken(response['refreshToken']);
      String? accessToken = await TokenManager.getAccessToken();
      print('Access Token: $accessToken');
      Get.snackbar('Thành công', 'Đăng nhập thành công');
      Get.offAndToNamed(AppRoutes.HOME);
    } on DioException catch (dioError) {
      error.value = dioError.message;
      Get.snackbar('Lỗi', error.value.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } catch (e) {
      error.value = 'Lỗi không xác định: ${e.toString()}';
      Get.snackbar('Đăng nhập thất bại', e.toString(), snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
