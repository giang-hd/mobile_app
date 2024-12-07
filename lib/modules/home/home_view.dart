import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Obx(() {
                  return Text(controller.customerName.toString());
                }),
              ),
              ElevatedButton(onPressed: () {
                controller.onChange();
              }, child: const Text("Change"))
            ],
          )),
    );
  }
}
