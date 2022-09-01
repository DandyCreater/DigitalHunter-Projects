import 'package:digital_hunter/presentation/resource/font/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomChipMuseumWidget extends StatelessWidget {
  final String? title;
  final Color? color;
  final Color? textColor;
  final Function() press;
  const CustomChipMuseumWidget(
      {Key? key,
      required this.title,
      required this.color,
      required this.textColor,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 25,
        width: 65,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title!,
            style: RobotoRegularThemeText(12, textColor!),
          ),
        ),
      ),
    );
  }
}
