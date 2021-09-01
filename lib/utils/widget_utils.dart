

import 'package:amplify/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetUtils{


  static TextStyle getMediumTextItalicStyle(){
    return TextStyle(
        fontSize: 30.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic,
        color: kThemeColor
    );
  }

  static TextStyle getMediumTextStyle(Color color){
    return TextStyle(
        fontSize: 16.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: color ?? Colors.white
    );
  }

  static TextStyle getLargeTextStyle({Color color = Colors.white}){
    return TextStyle(
        fontSize: 20.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: color
    );
  }

  static TextStyle getMediumTextBoldStyle({Color color = Colors.white}){
    return TextStyle(
        fontSize: 16.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color
    );
  }

  static TextStyle getRegularTextStyle({Color color = Colors.white}){
    return TextStyle(
        fontSize: 15.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: color
    );
  }

  static TextStyle getRegularHintTextStyle(){
    return TextStyle(
        fontSize: 15.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: Colors.grey
    );
  }

  static TextStyle getRegularTextBoldStyle({Color color = Colors.black}){
    return TextStyle(
        fontSize: 15.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: color
    );
  }
  static TextStyle getMediumTextAppThemeStyle(){
    return TextStyle(
        fontSize: 15.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: kThemeColor
    );
  }

  static TextStyle getRegularTextAppThemeStyle(){
    return TextStyle(
        fontSize: 12.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: kThemeColor
    );
  }

  static TextStyle getSmallTextBoldStyle({Color color = Colors.white}){
    return TextStyle(
        fontSize: 12.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: color
    );
  }

  static TextStyle getSmallTextStyle(){
    return TextStyle(
        fontSize: 10.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: Colors.white
    );
  }
}