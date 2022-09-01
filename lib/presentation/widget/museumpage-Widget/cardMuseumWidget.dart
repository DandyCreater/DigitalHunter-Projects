import 'package:digital_hunter/presentation/resource/color/color_manager.dart';
import 'package:digital_hunter/presentation/resource/font/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class CustomCardMuseumWidget extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? year;
  final String? status;
  final String? name;
  final Function() press;
  const CustomCardMuseumWidget(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.year,
      required this.status,
      required this.name,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      width: double.infinity,
      height: 145,
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 30,
                color: ColorManager.shadowColor.withOpacity(0.2),
                offset: const Offset(0, 4))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 105,
                      width: 105,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imageUrl!), fit: BoxFit.cover)),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset("assets/images/image_medal.png"))
                ],
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: PoppinsSemiBoldThemeText(
                          12,
                          ColorManager.blackColor,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "$year ",
                          style: RobotoRegularThemeText(
                              12, ColorManager.greyTextColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: "• ",
                              style: RobotoRegularThemeText(
                                  12, ColorManager.greyTextColor),
                            ),
                            TextSpan(
                              text: status,
                              style: RobotoRegularThemeText(
                                  12, ColorManager.greyTextColor),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorManager.whiteColor, width: 4),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorManager.shadowColor
                                          .withOpacity(0.2),
                                      offset: const Offset(2, 4))
                                ],
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/image_user.png"),
                                    fit: BoxFit.cover)),
                          ),
                          Flexible(
                            child: SizedBox(
                              height: 28,
                              child: Center(
                                child: Text(
                                  name!,
                                  style: RobotoRegularThemeText(
                                      12, ColorManager.greyColor),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: press,
                              child: Container(
                                height: 30,
                                width: 21.w,
                                decoration: BoxDecoration(
                                    color: ColorManager.whiteColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: ColorManager.blackColor)),
                                child: Center(
                                  child: Text(
                                    "Lihat Karya",
                                    style: RobotoMediumThemeText(
                                        10, ColorManager.greyColor),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
