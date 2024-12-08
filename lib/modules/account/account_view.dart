import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/modules/account/account_controller.dart';

import '../../generated/l10n.dart';
import '../../service/color_app.dart';
import '../../utils/widget/button_common.dart';
import '../../utils/widget/widgetOne.dart';

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
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                  controller.detailAccount.value.profile?.img ?? "https://via.placeholder.com/150",
                                ),
                                fit: BoxFit.cover,
                              ),
                                borderRadius: BorderRadius.circular(20), ),
                              height: 80,
                              width: 80,
                              child: Container()),
                          const SizedBox(
                            width: 16,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name User',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      AccountInfoTile(
                        label: S.of(context).userName,
                        value:
                            controller.detailAccount.value.profile?.name ?? S.current.isNullValue,
                      ),
                      AccountInfoTile(
                        label: S.of(context).email,
                        value: controller.detailAccount.value.username.toString(),
                      ),
                      AccountInfoTile(
                        label: S.of(context).phoneNumber,
                        value:
                            controller.detailAccount.value.profile?.phone ?? S.current.isNullValue,
                      ),
                      AccountInfoTile(
                        label: S.of(context).address,
                        value:
                            controller.detailAccount.value.profile?.address ?? S.current.isNullValue,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      WidgetOne(
                        title: S.of(context).information,
                        icon: Icons.info_outlined,
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      WidgetOne(
                        title: S.of(context).changePass,
                        icon: Icons.lock_outline,
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              })),
              ButtonCommon(
                onTap: () {
                  // if (Get.locale?.languageCode == 'en') {
                  //   Get.updateLocale(const Locale('vi'));
                  // } else {
                  //   Get.updateLocale(const Locale('en'));
                  // }
                  controller.logout();
                },
                enableIcon: false,
                textButton: S.of(context).logout,
                bgColor: Colors.white,
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
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
