import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ColorSwatch appPalette = ColorSwatch(0xFF5200F5, {
  'primaryColor': Color(0xFF5200F5),
  'primaryDarkColor': Color(0xFF050081),
  'primaryLightColor': Color(0xFF9246FF),
  'secondaryColor': Color(0xFFA70EAC),
  'secondaryDarkColor': Color(0xFF74007C),
  'secondaryLightColor': Color(0xFFDC51DE),
  'primaryTextColor': Color(0xFFFFFFFF),
  'secondaryTextColor': Color(0xFFFFFFFF),
  'surfaceColor': Colors.grey.withOpacity(0.15),
});

/// Ref: https://material.io/components/cards/flutter#theming-a-card
ThemeData get lightTheme {
  final ThemeData base = ThemeData.light();
  final ColorScheme colorScheme = ColorScheme.light(
    primary: appPalette['primaryColor'],
    primaryVariant: appPalette['primaryDarkColor'],
    secondary: appPalette['secondaryColor'],
    secondaryVariant: appPalette['secondaryDarkColor'],
    surface: appPalette['surfaceColor'],
    onSecondary: Colors.white,
  );
  return base.copyWith(
    colorScheme: colorScheme,
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
    cardTheme: base.cardTheme.copyWith(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: Colors.transparent,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: appPalette['primaryDarkColor'],
      ),
      actionsIconTheme: IconThemeData(
        color: appPalette['primaryDarkColor'],
      ),
    ),
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Varela',
        ),
    primaryTextTheme: ThemeData.light().primaryTextTheme.apply(
          fontFamily: 'Varela',
          bodyColor: appPalette['primaryDarkColor'],
        ),
  );
}
