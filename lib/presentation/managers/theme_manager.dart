import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_1_responsive/presentation/managers/style_manager.dart';
import 'package:task_1_responsive/presentation/managers/value_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main Colors
    primaryColor: ColorManager.primary,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.primary,
        statusBarIconBrightness: Brightness.light,
      ),
      centerTitle: true,
      elevation: AppSize.s4,
      actionsIconTheme: const IconThemeData(
        size: AppSize.s30,
      ),
      color: ColorManager.primary,
      titleTextStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s20),
    ),
    textTheme: TextTheme(
      bodyLarge: getBoldStyle(color: ColorManager.black),
    ),
  );
}
