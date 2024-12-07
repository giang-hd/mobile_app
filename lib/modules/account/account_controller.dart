import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/account/account.dart';
import '../../service/service.dart';
import '../../service/token_managerment.dart';

class AccountController extends GetxController {
  late ApiService apiService = ApiService(DioConfig.createDio());

  final RxnString error = RxnString();
  final RxBool isLoading = false.obs;

  final detailAccount = AccountModel().obs;

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
}
