import 'dart:ffi';

import 'package:amplify/theme/colors.dart';
import 'package:amplify/utils/widget_utils.dart';
import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;
  final Color color;
  final Double horizontalPadding;
  final double leftMargin;
  final double rightMargin;
  final double height;

  const ButtonWidget(
      {Key key,
      this.icon,
      this.text,
      this.onClicked,
      this.color,
      this.horizontalPadding,
        this.leftMargin,
        this.rightMargin,
        this.height,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(left: leftMargin ?? 0,right: rightMargin ?? 0),
        height: height ?? 55,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 10),
          child: Container(
              decoration: new BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color(0x80000000),
                  blurRadius: 12.0,
                  offset: Offset(0.0, 5.0),
                ),
              ],
                borderRadius: BorderRadius.circular(30),
                gradient: new LinearGradient(
                  colors: [
                    kThemeColor,
                    kThemeColor300,
                    kThemeColor200,
                    kThemeColor100,
                    kThemeColor100,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0,0.5,0.7,0.8, 1.0],
                  tileMode: TileMode.clamp
                ),
              ),
            child: buildButton(context),
          ),
        ),
      );

  Widget buildButton(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onClicked,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon ?? Container(),
                Text(
                  text,
                  style: WidgetUtils.getRegularTextBoldStyle(),
                ),
                Opacity(
                  opacity: 0,
                  child: icon ?? Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
