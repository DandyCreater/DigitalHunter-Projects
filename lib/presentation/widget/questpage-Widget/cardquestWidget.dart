import 'package:digital_hunter/presentation/resource/color/color_manager.dart';
import 'package:digital_hunter/presentation/resource/font/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardQuestWidget extends StatelessWidget {
  final String? title;
  final String? star;
  final String? coins;
  final String? count;
  final String? progress;
  final Function() press;
  const CardQuestWidget(
      {Key? key,
      required this.title,
      required this.star,
      required this.coins,
      required this.count,
      required this.progress,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 19,
              offset: const Offset(0, 4),
              color: ColorManager.shadowColor.withOpacity(0.2),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: double.infinity,
              width: 160,
              child: Column(
                children: [
                  Text(
                    title!,
                    style: PoppinsSemiBoldThemeText(
                        18, ColorManager.courseTextColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 65,
                        height: 30,
                        decoration: BoxDecoration(
                          color: ColorManager.courseSubButton,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              star!,
                              style: RobotoRegularThemeText(
                                  17, ColorManager.courseTextColor),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: SvgPicture.asset(
                                "assets/icons/icon_star.svg",
                                height: 16,
                                width: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 84,
                        height: 30,
                        decoration: BoxDecoration(
                          color: ColorManager.courseSubButton,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              coins!,
                              style: RobotoRegularThemeText(
                                  17, ColorManager.courseTextColor),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 1),
                              child: SvgPicture.asset(
                                "assets/icons/icon_coin.svg",
                                height: 16,
                                width: 16,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 160,
              child: Center(
                child: Text(
                  "$progress/$count",
                  style: RobotoRegularThemeText(17, ColorManager.greyTextColor),
                ),
              ),
            ),
            SizedBox(
              height: 160,
              child: Center(
                  child: SizedBox(
                height: 48,
                width: 80,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                        backgroundColor: MaterialStateProperty.all(
                            progress != count
                                ? ColorManager.courseIncompleteButton
                                : ColorManager.courseCompleteButton)),
                    onPressed: press,
                    child: Text(
                      progress != count ? "Pergi" : "Ambil",
                      style:
                          RobotoSemiBoldThemeText(17, ColorManager.whiteColor),
                    )),
              )),
            )
          ],
        ),
      ),
    );
  }
}
