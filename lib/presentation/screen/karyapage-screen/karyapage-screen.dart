import 'package:digital_hunter/presentation/resource/color/color_manager.dart';
import 'package:digital_hunter/presentation/resource/font/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class KaryaPageScreen extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  const KaryaPageScreen({Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.blackColor,
          ),
        ),
        elevation: 0,
        backgroundColor: ColorManager.whiteColor,
        automaticallyImplyLeading: false,
        title: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 20.w),
          child: Text(
            "Karya",
            style: PoppinsSemiBoldThemeText(20, ColorManager.appbarTitleColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              children: [
                Container(
                  height: 30.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(imageUrl!), fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  title!,
                  style: RobotoSemiBoldThemeText(20, ColorManager.blackColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
                    style:
                        RobotoRegularThemeText(15, ColorManager.greyTextColor),
                    children: <TextSpan>[
                      TextSpan(
                        text: " Read More ",
                        style: RobotoSemiBoldThemeText(
                            15, ColorManager.activeColor),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                                color:
                                    ColorManager.shadowColor.withOpacity(0.2))
                          ],
                          border: Border.all(
                              color: ColorManager.whiteColor, width: 3),
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              image:
                                  AssetImage("assets/images/image_user.png"))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rahmadhana Ramadan",
                          style: RobotoSemiBoldThemeText(
                              16, ColorManager.blackColor),
                        ),
                        Text(
                          "Champion",
                          style: RobotoRegularThemeText(
                              16, ColorManager.greyColor),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      height: 25,
                      width: 80,
                      decoration: BoxDecoration(
                          color: ColorManager.colorChipKaryaColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Hipster",
                          style: PoppinsRegularThemeText(
                              12, ColorManager.greyColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 25,
                      width: 100,
                      decoration: BoxDecoration(
                          color: ColorManager.colorChipKaryaColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "UI/UX Design",
                          style: PoppinsRegularThemeText(
                              12, ColorManager.greyColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 53,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorManager.activeColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Lihat selengkapnya",
                      style:
                          PoppinsMediumThemeText(15, ColorManager.whiteColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
    );
  }
}
