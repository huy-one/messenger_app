import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messenger_app/src/components/theme/constants.dart';

final appBarTheme =AppBarTheme(centerTitle: false,elevation: 0);
ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: xPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme,
      iconTheme: IconThemeData(color: Color(0xFFFF80FF)),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: Color(0xFFFF80FF)),
      colorScheme: ColorScheme.light(
          primary: xPrimaryColor,
          secondary: xSecondaryColor,
          error: kErrorColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: xContentColorLightTheme.withOpacity(0.7),
        unselectedItemColor: xContentColorLightTheme.withOpacity(0.32),
        selectedIconTheme: IconThemeData(color: xPrimaryColor),
        showSelectedLabels: true,
      )
  );

}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
      primaryColor: xPrimaryColor,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: appBarTheme,
      iconTheme: IconThemeData(color: xPrimaryColor),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: xPrimaryColor),
      colorScheme: ColorScheme.light(
          primary: xPrimaryColor,
          secondary: xSecondaryColor,
          error: kErrorColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: xContentColorDarkTheme.withOpacity(0.7),
        unselectedItemColor: xContentColorDarkTheme.withOpacity(0.32),
        selectedIconTheme: IconThemeData(color: xPrimaryColor),
        showSelectedLabels: true,
      )
  );
}