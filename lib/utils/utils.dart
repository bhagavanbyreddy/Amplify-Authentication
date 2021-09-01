

import 'package:amplify/theme/colors.dart';
import 'package:amplify/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:validate/validate.dart';

class Utils{

  static const LOG_ENABLE = true;
  static const LOG_TAG = '[Amplify]';

  static print(dynamic data) {
    if (LOG_ENABLE) {
      final now = DateTime.now().toUtc().toString().split(' ').last;
      debugPrint('[$now]$LOG_TAG${data.toString()}');
    }
  }

  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: kPurple400,
        textColor: Colors.white,
        fontSize: 10
    );
  }

  static showSnackBar(BuildContext context, message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: WidgetUtils.getRegularTextStyle(color: Colors.black),

      ),
      backgroundColor: kThemeColor,
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static String validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

}