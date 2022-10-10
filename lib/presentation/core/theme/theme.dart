import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      fontFamily: 'Sora',
      primaryColor: AppColors.themeColors.primaryColor,
      primaryColorDark: AppColors.themeColors.primaryDark,
      colorScheme: ColorScheme.light(
        primary: AppColors.themeColors.primaryColor,
        secondary: AppColors.themeColors.accentColor,
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.blackColor),
        color: Colors.deepPurpleAccent, //<-- SEE HERE
      ),
      backgroundColor: AppColors.themeColors.backgroundColor,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.themeColors.textSelectionColor,
      ),
    ).copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColors.themeColors.primaryColor,
          textStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class AppColors {
  static ThemeColors themeColors = ThemeColors(
    blueColor,
    brightSunColor,
    orangeColor,
    whiteColor,
    blueColor.withOpacity(0.2),
  );
  static const Color whiteColor = Color(0xffffffff);
  static const Color orangeColor = Color(0xffe14a15);
  static const Color blueColor = Color(0xff23196a);
  static const Color greyTextColor = Color(0xff666666);
  static const Color lightGreyColor = Color(0xffb3b3b3);
  static const Color blackColor = Color(0xff010f07);
  static const Color wrongPinTextColor = Color(0xffff642A);
  static const Color secondaryBackgroundColor = Color(0xffedf1f6);
  static const Color inputFillColor = Color(0xfffbfbfb);
  static const Color listBackgroundColor = Color(0xffedf1f6);
  static const Color brightSunColor = Color(0xffFFCC3F);
  static const Color greenColor = Color(0xff50C878);
}

class ThemeColors {
  final Color primaryColor;
  final Color primaryDark;
  final Color accentColor;
  final Color backgroundColor;
  final Color textSelectionColor;

  ThemeColors(
    this.primaryColor,
    this.primaryDark,
    this.accentColor,
    this.backgroundColor,
    this.textSelectionColor,
  );
}
