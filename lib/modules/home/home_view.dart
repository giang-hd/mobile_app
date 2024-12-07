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
          Obx(() {
            return SizedBox(
              height: 120,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  primary: false,
                  itemCount: controller.listAccount.length,
                  itemBuilder: (context, index) {
                    return Text(
                      controller.listAccount[index].profile!.name.toString(),
                      style: const TextStyle(color: Colors.red),
                    );
                  }),
            );
          }),
          ElevatedButton(
              onPressed: () {
                //controller.fetchAccounts();
              },
              child: const Text("Change"))
        ],
      )),
    );
  }
}
