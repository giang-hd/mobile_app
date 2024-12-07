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

                  // Ô nhập tên (chỉ khi đăng ký)
                  if (!controller.isLogin.value)
                    TextField(
                      controller: controller.nameController,
                      decoration: const InputDecoration(
                        labelText: 'Họ và Tên',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                    ),

                  const SizedBox(height: 10),

                  // Ô nhập email
                  TextField(
                    controller: controller.emailController,
                    decoration:  const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 10),

                  // Ô nhập mật khẩu
                  TextField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Mật Khẩu',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if(controller.isValue.value)
                    Align(alignment: Alignment.centerLeft,
                        child: Text(controller.error.value.toString(), style: const TextStyle(color: Colors.red))),

                  // Nhớ mật khẩu và quên mật khẩu (chỉ khi đăng nhập)
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
                    onPressed: controller.submit,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: Text(
                        controller.isLogin.value ? 'Đăng Nhập' : 'Đăng Ký'),
                  ),

                  const SizedBox(height: 10),

                  // Chuyển đổi giữa đăng nhập và đăng ký
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
