
// main_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/modules/account/account_view.dart';

import '../home/home_view.dart';

class MainController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final List<Widget> pages = [
    const HomePage(),
    const HomePage(),
    const AccountView(),
  ];

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
