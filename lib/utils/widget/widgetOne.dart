import 'package:flutter/material.dart';

class WidgetOne extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function? onTap;

  const WidgetOne({super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function(),
      child: Container(
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.red, width: 0.1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: const TextStyle(fontWeight: FontWeight.bold),),
            Icon(
              icon,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
