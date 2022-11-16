import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task_1_responsive/application/app_data.dart';

import '../../managers/assets_manager.dart';
import '../../managers/color_manager.dart';
import '../../managers/icons_manager.dart';
import '../../managers/string_manager.dart';
import '../../managers/value_manager.dart';

PreferredSizeWidget appBarTask() {
  return AppBar(
    leading: const Icon(AppIcons.translate),
    actions: const [
      Icon(AppIcons.output),
      SizedBox(width: AppSize.s12),
    ],
    title: const Text(
      AppStrings.mainAppBar,
    ),
  );
}

List listOfIconsAndStringsBottoms = [
  {'icon': AppIcons.parent, 'text': AppStrings.parents},
  {'icon': AppIcons.requestInterview, 'text': AppStrings.requestInterview},
  {'icon': AppIcons.examples, 'text': AppStrings.examples},
  {'icon': AppIcons.jobApplication, 'text': AppStrings.jobApplication},
  {'icon': AppIcons.generalNews, 'text': AppStrings.generalNews},
  {'icon': AppIcons.importantLinks, 'text': AppStrings.importantLinks},
  {'icon': AppIcons.contactUs, 'text': AppStrings.contactUs},
  {'icon': AppIcons.importantLinks, 'text': AppStrings.importantLinks},
  {'icon': AppIcons.contactUs, 'text': AppStrings.contactUs},
];

List listOfImagesSlider = [
  ImageAssets.slider1,
  ImageAssets.slider2,
  ImageAssets.slider3,
  ImageAssets.slider4,
];

CarouselSlider sliderTask(BuildContext context) {
  double ifItVertical = AppData(context).mediaQueryOf.size.height / 2.5;
  double ifItHorizontal = AppData(context).mediaQueryOf.size.height / 6;
  var orientation = AppData(context).mediaQueryOf.orientation;
  return CarouselSlider(
    options: CarouselOptions(
        viewportFraction: orientation == Orientation.landscape ? 0.6 : 0.8,
        height: orientation == Orientation.landscape
            ? ifItVertical
            : ifItHorizontal,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInOutCubic),
    items: listOfImagesSlider.map((image) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: orientation == Orientation.landscape
                ? AppData(context).mediaQueryOf.size.width / 2
                : AppData(context).mediaQueryOf.size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(AppSize.s14),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s14),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      );
    }).toList(),
  );
}

Widget bottomTask(
    {required String text,
    required IconData icon,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () {},
    child: Center(
      child: Container(
        margin: const EdgeInsets.all(15),
        height: 130,
        width: 130,
        child: shapeOfBottom(text, icon, context),
      ),
    ),
  );
}

Widget shapeOfBottom( String text,
   IconData icon,
   BuildContext context){return Stack(
  alignment: Alignment.bottomLeft,
  children: [
    Positioned(
      left: 110,
      bottom: 110,
      child: Container(
          transform: Matrix4.rotationZ(20),
          child: Icon(
            Icons.star,
            size: 15,
            color: ColorManager.primary,
          )),
    ),
    Positioned(
      left: 100,
      bottom: 100,
      child: Container(
          transform: Matrix4.rotationZ(15),
          child: Icon(
            Icons.star,
            size: 17,
            color: ColorManager.primary,
          )),
    ),
    Positioned(
      left: 88,
      bottom: 88,
      child: Icon(
        Icons.star,
        size: 18,
        color: ColorManager.primary,
      ),
    ),
    Container(
      margin: const EdgeInsets.all(6),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ColorManager.primary, width: 3),
        color: ColorManager.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Icon(
              icon,
              color: ColorManager.primary,
            ),
          ),
          Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
              )),
        ],
      ),
    ),
  ],
);}

Widget gridViewWidget(BuildContext context) {
  bool isShowLastOneOrNot = ((listOfIconsAndStringsBottoms.length.isOdd &&
          AppData(context).mediaQueryOf.orientation == Orientation.portrait) ||
      (listOfIconsAndStringsBottoms.length.isOdd &&
          AppData(context).mediaQueryOf.orientation == Orientation.landscape &&
          listOfIconsAndStringsBottoms.length % 3 == 1));

  return GridView.builder(
    padding: const EdgeInsets.all(10),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisSpacing: 10,
      childAspectRatio:
          AppData(context).mediaQueryOf.orientation == Orientation.landscape
              ? 3 / 2
              : 1,
      crossAxisSpacing: 10,
      crossAxisCount:
          AppData(context).mediaQueryOf.orientation == Orientation.landscape
              ? 3
              : 2,
    ),
    itemCount: isShowLastOneOrNot
        ? listOfIconsAndStringsBottoms.length - 1
        : listOfIconsAndStringsBottoms.length,
    itemBuilder: (context, index) => bottomTask(
        icon: listOfIconsAndStringsBottoms[index]['icon'],
        text: listOfIconsAndStringsBottoms[index]['text'],
        context: context),
  );
}
