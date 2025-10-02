import 'package:flutter/material.dart';

class AppTypography {
  static const fontFamily = "Roboto"; // أو ممكن SF Pro لو ضفتيه

  static const fontWeightBold = FontWeight.w700;
  static const fontWeightSemiBold = FontWeight.w600;
  static const fontWeightMedium = FontWeight.w600;
  static const fontWeightNormal = FontWeight.w500;

  static const h1 = TextStyle(
    fontSize: 35,
    fontWeight: fontWeightBold,
    height: 1.5,
    fontFamily: fontFamily,
  );

  static const h2 = TextStyle(
    fontSize: 30,
    fontWeight: fontWeightSemiBold,
    height: 1.5,
    fontFamily: fontFamily,
  );

  static const h3 = TextStyle(
    fontSize: 18,
    fontWeight: fontWeightMedium,
    height: 1.5,
    fontFamily: fontFamily,
  );

  static const h4 = TextStyle(
    fontSize: 16,
    fontWeight: fontWeightMedium,
    height: 1.5,
    fontFamily: fontFamily,
  );

  static const body = TextStyle(
    fontSize: 16,
    fontWeight: fontWeightNormal,
    height: 1.5,
    fontFamily: fontFamily,
  );

  static const label = TextStyle(
    fontSize: 16,
    fontWeight: fontWeightMedium,
    height: 1.5,
    fontFamily: fontFamily,
  );

  static const button = TextStyle(
    fontSize: 16,
    fontWeight: fontWeightMedium,
    height: 1.5,
    fontFamily: fontFamily,
  );

  static const input = TextStyle(
    fontSize: 16,
    fontWeight: fontWeightNormal,
    height: 1.5,
    fontFamily: fontFamily,
  );
}
