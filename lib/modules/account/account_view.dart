import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobile_app/modules/account/account_controller.dart';

import '../../service/color_app.dart';
import '../../utils/widget/common_widget.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(child: Obx(() {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child:
                              Image.network("https://via.placeholder.com/150"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    AccountInfoTile(
                      label: 'Username',
                      value: controller.detailAccount.value.profile?.name ?? "",
                    ),
                    AccountInfoTile(
                      label: 'Email',
                      value: controller.detailAccount.value.username ?? "",
                    ),
                    AccountInfoTile(
                      label: 'Phone',
                      value:
                          controller.detailAccount.value.profile?.phone ?? "",
                    ),
                    AccountInfoTile(
                      label: 'Address',
                      value:
                          controller.detailAccount.value.profile?.address ?? "",
                    )
                  ],
                );
              })),
              ButtonCommon(
                onTap: () {
                  print("object");
                },
                enableIcon: false,
                textButton: 'Logout',
                bgColor: primaryColor,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AccountInfoTile extends StatelessWidget {
  final String label;
  final String value;

  const AccountInfoTile({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
