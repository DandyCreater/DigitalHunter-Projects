// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

class FontManager {
  static const String Poppins = "Poppins";
  static const String Roboto = "Roboto";
  static const String Inter = "Inter";
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w600;
}

//main Theme
TextStyle _getThemeText(
    double fontSize, FontWeight fontWeight, Color color, String fontFamily) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

//Roboto Area
TextStyle RobotoLightThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Roboto,
    fontWeight: FontWeightManager.light,
    color: color,
  );
}

TextStyle RobotoRegularThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Roboto,
    fontWeight: FontWeightManager.regular,
    color: color,
  );
}

TextStyle RobotoMediumThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Roboto,
    fontWeight: FontWeightManager.medium,
    color: color,
  );
}

TextStyle RobotoSemiBoldThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Roboto,
    fontWeight: FontWeightManager.semiBold,
    color: color,
  );
}

TextStyle RobotoBoldThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Roboto,
    fontWeight: FontWeightManager.bold,
    color: color,
  );
}

//Inter Area
TextStyle InterLightThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Inter,
    fontWeight: FontWeightManager.light,
    color: color,
  );
}

TextStyle InterRegularThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Inter,
    fontWeight: FontWeightManager.regular,
    color: color,
  );
}

TextStyle InterMediumThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Inter,
    fontWeight: FontWeightManager.medium,
    color: color,
  );
}

TextStyle InterSemiBoldThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Inter,
    fontWeight: FontWeightManager.semiBold,
    color: color,
  );
}

TextStyle InterBoldThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Inter,
    fontWeight: FontWeightManager.bold,
    color: color,
  );
}

TextStyle PoppinsLightThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Poppins,
    fontWeight: FontWeightManager.light,
    color: color,
  );
}

TextStyle PoppinsRegularThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Poppins,
    fontWeight: FontWeightManager.regular,
    color: color,
  );
}

TextStyle PoppinsMediumThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Poppins,
    fontWeight: FontWeightManager.medium,
    color: color,
  );
}

TextStyle PoppinsSemiBoldThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Poppins,
    fontWeight: FontWeightManager.semiBold,
    color: color,
  );
}

TextStyle PoppinsBoldThemeText(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManager.Poppins,
    fontWeight: FontWeightManager.bold,
    color: color,
  );
}
