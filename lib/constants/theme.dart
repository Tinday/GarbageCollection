import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  elevatedButtonTheme: elevatedButtonTheme,
  outlinedButtonTheme: outlinedButtonTheme,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
  fontFamily: 'EuclidCircularA',
  radioTheme: RadioThemeData(
    fillColor: MaterialStateColor.resolveWith(
      (Set<MaterialState> states) => accentColor,
    ),
  ),
);

// color
const Color primaryColor = Color(0xff1A1A2A);
const Color accentColor = Color(0xff984063);
const Color secondaryAccentColor = Color(0xffE18DAE);
const Color blackColor = Colors.black;
const Color whiteColor = Colors.white;
const Color inactiveGreyColor = Color(0xffC4C4C4);
const Color dividerGreyColor = Color(0xff858585);
const Color profileDividerGreyColor = Color(0xffDADADA);
const Color onboardingRedColor = Color(0xffEA4335);
const Color facebookBlueColor = Color(0xff4285F4);
const Color pinkColor = Color(0xffFFE1ED);
const Color homepagePinkColor = Color(0xffFFF4F9);
const Color homepageGreyColor = Color(0xffEFEFF0);
const Color placeHolderPinkColor = Color(0xffF24D98);
const Color greyTextColor = Color(0xff969696);
const Color redColor = Color(0xffA90101);
const Color incomeGreenColor = Color(0xff0C981C);
const Color lightGreyColor = Color(0xffF6F6F6);
const Color lightBlackColor = Color(0xff3E3E3E);
const Color greyGraphColor = Color(0xffE9E9EA);
// elevated button theme
final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
  ),
);

final OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: primaryColor,
    side: const BorderSide(color: primaryColor, width: 1.5),
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
  ),
);
//input decoration
final InputDecoration inputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
  ),
);
