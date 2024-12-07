

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/models/account/account.dart';
import 'package:mobile_app/service/app_page.dart';
import 'package:mobile_app/service/service.dart';

import '../../service/token_managerment.dart';

class HomeController extends GetxController{
  late ApiService apiService = ApiService(DioConfig.createDio());
  final listAccount = <AccountModel>[].obs;

  final RxnString error = RxnString();
  final RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchAccounts();
  }

  Future<void> fetchAccounts() async {
    try {
      isLoading.value = true;
      final response = await apiService.getAccount();
      listAccount.value = response.data;
    } on DioException catch (dioError) {
      print('Dio Error Type: ${dioError.type}');
      print('Dio Error Message: ${dioError.message}');

      if (dioError.response != null) {
        print('Error Response Data: ${dioError.response?.data}');
        print('Error Status Code: ${dioError.response?.statusCode}');
      }
      error.value = handleError(dioError);
      Get.snackbar('Lỗi rồi', error.value.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } catch (e) {
      error.value = 'Lỗi không xác định: ${e.toString()}';
      print(e.toString());
      Get.snackbar('Lỗi nè', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}