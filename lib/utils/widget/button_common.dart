import 'package:flutter/material.dart';

class ButtonCommon extends StatelessWidget {
  final String textButton;
  final bool enableIcon;
  final IconData? icon;
  final Function? onTap;
  final EdgeInsets? margin;
  final Color? bgColor;
  final Color? borderColor;
  final Color? textColor;
  final FontWeight? fontWeight;

  const ButtonCommon({
    super.key,
    required this.textButton,
    this.enableIcon = true,
    this.icon,
    this.onTap,
    this.margin,
    this.bgColor,
    this.textColor,
    this.borderColor, this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function(),
      child: Container(
          height: 40,
          margin: margin,
          width: double.infinity,
          decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(color: borderColor ?? Colors.grey, width: 0.5),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                textButton,
                style: TextStyle(color: textColor, fontWeight: fontWeight),
              )),
              SizedBox(
                width: enableIcon ? 8 : 0,
              ),
              enableIcon ? Icon(icon) : const SizedBox(),
            ],
          )),
    );
  }
}
