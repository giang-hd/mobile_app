

import 'package:get/get.dart';

class HomeController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    print(customerName);
  }

  var customerName = "hahaha".obs;

  void onChange() async {
    customerName.value = "Done";
  }
}