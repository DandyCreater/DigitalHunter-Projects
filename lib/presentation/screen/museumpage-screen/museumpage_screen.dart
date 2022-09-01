import 'package:digital_hunter/presentation/bloc/museum-bloc/museum_bloc.dart';
import 'package:digital_hunter/presentation/resource/color/color_manager.dart';
import 'package:digital_hunter/presentation/resource/font/font_manager.dart';
import 'package:digital_hunter/presentation/widget/museumpage-Widget/cardMuseumWidget.dart';
import 'package:digital_hunter/presentation/widget/museumpage-Widget/customchipWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class MuseumPageScreen extends StatefulWidget {
  const MuseumPageScreen({Key? key}) : super(key: key);

  @override
  State<MuseumPageScreen> createState() => _MuseumPageScreenState();
}

class _MuseumPageScreenState extends State<MuseumPageScreen> {
  var index = 0;

  Widget juarasatu() => Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: SizedBox(
                height: 80.h,
                child: BlocBuilder<MuseumBloc, MuseumState>(
                  builder: (context, state) {
                    if (state is MuseumSuccess) {
                      var items = state.okContentMuseum!.items;
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: items!.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                CustomCardMuseumWidget(
                                    imageUrl: items[index].imageUrl,
                                    title: items[index].title,
                                    year: items[index].year,
                                    status: items[index].status,
                                    name: items[index].name,
                                    press: () {}),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          }));
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ))
        ],
      );

  Widget juaradua() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Juara 2",
              style: PoppinsRegularThemeText(
                12,
                ColorManager.activeColor,
              ),
            ),
          ),
        ],
      );

  Widget juaratiga() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Juara 3",
              style: PoppinsRegularThemeText(12, ColorManager.activeColor),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return Scaffold(
          backgroundColor: ColorManager.backgroundColor,
          appBar: AppBar(
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
            title: Text(
              "Museum of Champions",
              style: PoppinsRegularThemeText(20, ColorManager.blackColor),
            ),
          ),
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 25,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: ColorManager.blackColor),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    "assets/icons/icon_filter.svg"),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Filter",
                                  style: RobotoRegularThemeText(
                                      12, ColorManager.blackColor),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 1;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 45,
                              decoration: BoxDecoration(
                                color: (index == 1)
                                    ? ColorManager.activeCustomChip
                                    : ColorManager.inActiveCustomChip,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  "All",
                                  style: RobotoRegularThemeText(
                                      12,
                                      (index == 1)
                                          ? ColorManager.whiteColor
                                          : ColorManager.blackColor),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CustomChipMuseumWidget(
                              title: "Juara 1",
                              color: (index == 2)
                                  ? ColorManager.activeCustomChip
                                  : ColorManager.inActiveCustomChip,
                              textColor: (index == 2)
                                  ? ColorManager.whiteColor
                                  : ColorManager.blackColor,
                              press: () {
                                setState(() {
                                  index = 2;
                                });
                              }),
                          const SizedBox(
                            width: 5,
                          ),
                          CustomChipMuseumWidget(
                              title: "Juara 2",
                              color: (index == 3)
                                  ? ColorManager.activeColor
                                  : ColorManager.inActiveCustomChip,
                              textColor: (index == 3)
                                  ? ColorManager.whiteColor
                                  : ColorManager.blackColor,
                              press: () {
                                setState(() {
                                  index = 3;
                                });
                              }),
                          const SizedBox(
                            width: 5,
                          ),
                          CustomChipMuseumWidget(
                              title: "Juara 3",
                              color: (index == 4)
                                  ? ColorManager.activeCustomChip
                                  : ColorManager.inActiveCustomChip,
                              textColor: (index == 4)
                                  ? ColorManager.whiteColor
                                  : ColorManager.blackColor,
                              press: () {
                                setState(() {
                                  index = 4;
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                  (index == 2)
                      ? juarasatu()
                      : (index == 3)
                          ? juaradua()
                          : (index == 4)
                              ? juaratiga()
                              : juarasatu(),
                ],
              )));
    }));
  }
}
