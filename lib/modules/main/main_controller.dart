// main_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/modules/account/account_controller.dart';
import 'package:mobile_app/modules/account/account_view.dart';

import '../home/home_view.dart';

class MainController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxList<Widget> pages = <Widget>[].obs;

  final AccountController accountController = Get.put(AccountController());

  @override
  void onInit() {
    super.onInit();
    _updatePages();
    accountController.detailAccount.listen((_) {
      _updatePages();
    });
  }

  void _updatePages() {
    pages.value = [
      if (accountController.detailAccount.value.admin == true) const HomePage(),
      const HomePage(),
      const AccountView(),
    ];
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
