import 'package:digital_hunter/presentation/resource/color/color_manager.dart';
import 'package:digital_hunter/presentation/resource/font/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CompetitionWidget extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? dayTime;
  final String? nation;
  final String? status;
  final Function() press;
  const CompetitionWidget(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.dayTime,
      required this.nation,
      required this.status,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Stack(
        children: [
          Container(
            height: 190,
            width: 120,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 2),
                      blurRadius: 1,
                      color: ColorManager.greyColor.withOpacity(0.2))
                ],
                color: ColorManager.whiteColor,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: AssetImage(imageUrl!), fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: PoppinsSemiBoldThemeText(
                            10, ColorManager.blackColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        dayTime!,
                        style: PoppinsSemiBoldThemeText(
                            12, ColorManager.primaryColor),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              nation!,
                              style: RobotoRegularThemeText(
                                  10, ColorManager.greyColor),
                            ),
                            Text(
                              status!,
                              style: RobotoRegularThemeText(
                                  10, ColorManager.greyColor),
                            ),
                          ],
                        ),
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
