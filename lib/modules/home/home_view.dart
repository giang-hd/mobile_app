import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/modules/home/home_controller.dart';

import '../../generated/l10n.dart';

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
            if(!controller.isStatusCode.value){
              return Center(child: Text(controller.error.toString()),);
            }
            return SizedBox(
              height: 120,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  primary: false,
                  itemCount: controller.listAccount.length,
                  itemBuilder: (context, index) {
                    return Text(
                      controller.listAccount[index].profile?.name ?? S.of(context).isNullValue,
                      style: const TextStyle(color: Colors.red),
                    );
                  }),
            );
          }),
        ],
      )),
    );
  }
}
