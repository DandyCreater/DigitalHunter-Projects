import 'package:digital_hunter/presentation/resource/color/color_manager.dart';
import 'package:digital_hunter/presentation/resource/font/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuDashboard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final Function() press;
  const MenuDashboard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(imageUrl!),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title!,
              style: RobotoMediumThemeText(13, ColorManager.blackColor),
            )
          ],
        ),
      ),
    );
  }
}
