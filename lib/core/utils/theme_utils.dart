import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_verse/core/utils/color_utils.dart';

class ThemeUtils {
  /// Custom page transitions
  static const _pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  /// Light style
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorUtils.lightPrimaryColor,
    accentColor: ColorUtils.lightAccentColor,
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: GoogleFonts.concertOneTextTheme(ThemeData.light().textTheme),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );

  /// Dark style
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorUtils.darkPrimaryColor,
    accentColor: ColorUtils.darkAccentColor,
    canvasColor: ColorUtils.darkCanvasColor,
    scaffoldBackgroundColor: ColorUtils.darkBackgroundColor,
    cardColor: ColorUtils.darkCardColor,
    dividerColor: ColorUtils.darkDividerColor,
    dialogBackgroundColor: ColorUtils.darkCardColor,
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: GoogleFonts.concertOneTextTheme(ThemeData.dark().textTheme),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
}
