// main_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/modules/main/main_controller.dart';
import 'package:mobile_app/service/color_app.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: controller.pages,
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            backgroundColor: ColorApp.three83,
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.white,
            onTap: controller.changeTabIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          )),
    );
  }
}
