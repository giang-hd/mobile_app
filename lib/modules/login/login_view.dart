import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.isLogin.value ? 'Đăng Nhập' : 'Đăng Ký',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller:controller.isLogin.value ? controller.emailController : controller.emailSignupController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller:controller.isLogin.value ? controller.passwordController : controller.passSignupController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Mật Khẩu',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (controller.isValue.value)
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(controller.error.value.toString(),
                            style: const TextStyle(color: Colors.red))),
                  if (controller.isLogin.value)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: controller.rememberMe.value,
                              onChanged: (bool? value) {
                                controller.rememberMe.value = value!;
                              },
                            ),
                            const Text('Nhớ mật khẩu'),
                          ],
                        ),
                        TextButton(
                          onPressed: controller.forgotPassword,
                          child: const Text('Quên mật khẩu?'),
                        ),
                      ],
                    ),

                  const SizedBox(height: 20),

                  // Nút đăng nhập/đăng ký
                  ElevatedButton(
                    onPressed: controller.isLogin.value ? controller.submit : controller.signup,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: Text(
                        controller.isLogin.value ? 'Đăng Nhập' : 'Đăng Ký'),
                  ),

                  const SizedBox(height: 10),

                  TextButton(
                    onPressed: controller.toggleAuthMode,
                    child: Text(controller.isLogin.value
                        ? 'Chưa có tài khoản? Đăng ký ngay'
                        : 'Đã có tài khoản? Đăng nhập'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
