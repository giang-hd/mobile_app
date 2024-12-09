import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/account/account.dart';
import '../../models/login/login.dart';
import '../../service/app_page.dart';
import '../../service/service.dart';
import '../../service/token_managerment.dart';

class AccountController extends GetxController {
  late ApiService apiService = ApiService(DioConfig.createDio());

  final RxnString error = RxnString();
  final RxBool isLoading = false.obs;

  final detailAccount = AccountModel().obs;

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;

  void toggleAllPasswordVisibility() {
    isPasswordVisible.toggle();
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  Future<void> getProfile() async {
    try {
      String? id = await TokenManager.getId();
      final response = await apiService.getAnAccount(id.toString());
      detailAccount.value = response.data!;
    } on DioException catch (dioError) {
      error.value = handleError(dioError);
      Get.snackbar('Lỗi', error.value.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } catch (e) {
      error.value = 'Lỗi không xác định: ${e.toString()}';
      Get.snackbar('Lỗi', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    isLoading.value = true;
    error.value = null;

    try {
      await apiService.logout();
      await TokenManager.clearTokens();
      await TokenManager.removeId();

      Get.snackbar('Thành công', 'Đăng xuất thành công',
          backgroundColor: Colors.green, colorText: Colors.white);

      Get.offAllNamed(AppRoutes.LOGIN);
    } on DioException catch (dioError) {
      error.value = handleError(dioError);
      Get.snackbar('Lỗi', error.value.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } catch (e) {
      error.value = 'Lỗi không xác định: ${e.toString()}';
      Get.snackbar('Đăng xuất thất bại', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> changePassword() async {
    if (await _validateInputs()) {
      String? id = await TokenManager.getId();
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('password');
      await apiService.putChangePass(
          id.toString(),
          PassRequest(
              oldPassword: oldPasswordController.text,
              newPassword: newPasswordController.text));
      await prefs.setString('password', newPasswordController.text);
      await TokenManager.removePass();
      await TokenManager.savePass(newPasswordController.text);
      Get.back();
      oldPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
      isPasswordVisible.value == false;
      Get.snackbar('Thông báo', 'Mật khẩu đã được thay đổi thành công');
    }
  }

  Future<bool> _validateInputs() async {
    String? pass = await TokenManager.getPass();
    if (oldPasswordController.text.isEmpty ||
        newPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar('Lỗi', 'Vui lòng nhập đủ thông tin');
      return false;
    }

    if (pass != oldPasswordController.text) {
      Get.snackbar('Lỗi', 'Mật khẩu cũ không khớp');
      return false;
    }

    if (newPasswordController.text.length < 6) {
      Get.snackbar('Lỗi', 'Mật khẩu phải có ít nhất 6 ký tự');
      return false;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar('Lỗi', 'Mật khẩu xác nhận không khớp');
      return false;
    }
    return true;
  }

  void getBack() {
    Get.back();
    oldPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
    isPasswordVisible.value == false;
  }

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
