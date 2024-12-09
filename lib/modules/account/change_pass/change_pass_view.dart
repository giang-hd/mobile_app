import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/modules/account/account_controller.dart';
import 'package:mobile_app/service/color_app.dart';
import 'package:mobile_app/utils/widget/button_common.dart';

class ChangePassView extends GetView<AccountController> {
  const ChangePassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thay Đổi Mật Khẩu'),
        leading: IconButton(
            onPressed: () {
              controller.getBack();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() => TextField(
                  controller: controller.oldPasswordController,
                  obscureText: !controller.isPasswordVisible.value,
                  decoration: const InputDecoration(
                    labelText: 'Mật khẩu cũ',
                  ),
                )),
            const SizedBox(height: 16),
            Obx(() => TextField(
                  controller: controller.newPasswordController,
                  obscureText: !controller.isPasswordVisible.value,
                  decoration: const InputDecoration(
                    labelText: 'Mật khẩu mới',
                  ),
                )),
            const SizedBox(height: 16),
            Obx(() => TextField(
                  controller: controller.confirmPasswordController,
                  obscureText: !controller.isPasswordVisible.value,
                  decoration: const InputDecoration(
                    labelText: 'Xác nhận mật khẩu mới',
                  ),
                )),
            const SizedBox(height: 24),
            Obx(() {
              return TextButton(
                onPressed: controller.toggleAllPasswordVisibility,
                child: Text(!controller.isPasswordVisible.value
                    ? 'Hiển thị mật khẩu'
                    : 'Ẩn mật khẩu'),
              );
            }),
            ButtonCommon(
              textButton: "Thay đổi mật khẩu",
              onTap: controller.changePassword,
              fontWeight: FontWeight.bold,
              enableIcon: false,
              bgColor: primaryColor,
              borderColor: primaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
