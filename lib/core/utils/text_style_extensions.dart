import 'package:flutter/material.dart';

extension TextStyleHelpers on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withSize(double size) => copyWith(fontSize: size);
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);
  TextStyle italic() => copyWith(fontStyle: FontStyle.italic);
  TextStyle underline() => copyWith(decoration: TextDecoration.underline);
  TextStyle lineThrough() => copyWith(decoration: TextDecoration.lineThrough);
  TextStyle overline() => copyWith(decoration: TextDecoration.overline);
  TextStyle letterSpacing(double spacing) => copyWith(letterSpacing: spacing);
  TextStyle wordSpacing(double spacing) => copyWith(wordSpacing: spacing);
  TextStyle heightLine(double height) => copyWith(height: height);
  TextStyle withFontFamily(String fontFamily) => copyWith(fontFamily: fontFamily);
  TextStyle withBackgroundColor(Color color) => copyWith(backgroundColor: color);
  TextStyle withDecorationColor(Color color) => copyWith(decorationColor: color);
  TextStyle withDecorationStyle(TextDecorationStyle style) => copyWith(decorationStyle: style);
  TextStyle bold() => copyWith(fontWeight: FontWeight.bold);
  TextStyle normal() => copyWith(fontWeight: FontWeight.normal);
  TextStyle semiBold() => copyWith(fontWeight: FontWeight.w600);
  TextStyle medium() => copyWith(fontWeight: FontWeight.w500);
  TextStyle light() => copyWith(fontWeight: FontWeight.w300);
  TextStyle extraBold() => copyWith(fontWeight: FontWeight.w800);
}
