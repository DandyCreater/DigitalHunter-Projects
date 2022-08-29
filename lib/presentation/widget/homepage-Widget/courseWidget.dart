import 'package:digital_hunter/presentation/resource/color/color_manager.dart';
import 'package:digital_hunter/presentation/resource/font/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseWidget extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? lessons;
  final String? classStatus;
  final String? subTitle;
  final String? status;
  final String? price;
  final String? poins;
  final String? student;
  final Function() press;
  const CourseWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.lessons,
    required this.classStatus,
    required this.subTitle,
    required this.status,
    required this.price,
    required this.poins,
    required this.student,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Stack(
        children: [
          Container(
            height: 230,
            width: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorManager.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.greyColor.withOpacity(0.2),
                    offset: const Offset(0, 2),
                    blurRadius: 2,
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              children: [
                Container(
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      image: DecorationImage(
                          image: AssetImage(imageUrl!), fit: BoxFit.cover)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          ColorManager.primaryColor.withOpacity(0.7)
                        ],
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 7),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            title!,
                            style: PoppinsSemiBoldThemeText(
                                14, ColorManager.whiteColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 68,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: ColorManager.primaryColor,
                                      size: 15,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      lessons!,
                                      style: InterRegularThemeText(
                                          9, ColorManager.blackColor),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 75,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: ColorManager.yellowColor,
                                      size: 15,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      classStatus!,
                                      style: InterRegularThemeText(
                                          9, ColorManager.blackColor),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        height: 32,
                        child: Text(
                          subTitle!,
                          style: InterSemiBoldThemeText(
                              14, ColorManager.blackColor),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            status!,
                            style: InterSemiBoldThemeText(
                                12, ColorManager.blackColor),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(price!,
                              style: InterRegularThemeText(
                                      12, ColorManager.blackColor)
                                  .copyWith(
                                      decoration: TextDecoration.lineThrough))
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/icon_star.svg",
                            height: 9,
                            width: 9,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            poins!,
                            style: InterSemiBoldThemeText(
                                9, ColorManager.blackColor),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${student} students",
                            style: InterSemiBoldThemeText(
                                9, ColorManager.greyColor),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
