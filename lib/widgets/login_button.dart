import 'package:amplify/theme/colors.dart';
import 'package:amplify/utils/widget_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginButton extends StatelessWidget {
  final Image image;
  final String text;
  final VoidCallback onClicked;
  final Color color;
  final double leftMargin;
  final double rightMargin;
  final Color textColor;

  LoginButton({this.image, this.text, this.onClicked, this.color,this.leftMargin,this.rightMargin, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: leftMargin ?? 0,right: rightMargin ?? 0),
      height: 47,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Container(
          decoration: new BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x80000000),
                blurRadius: 12.0,
                offset: Offset(0.0, 5.0),
              ),
            ],
              borderRadius: BorderRadius.circular(30),
              gradient: color == null
                  ? LinearGradient(
                      colors: [
                        kPurpleGradient300,
                        kPurpleGradient400,
                        kPurpleGradient500,
                        kPurpleGradient600,
                        kPurpleGradient700,
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 0.5, 0.7, 0.8, 1.0],
                      tileMode: TileMode.clamp
              )
                  : LinearGradient(
                  colors: [
                    color,
                  ],
                  stops: [1.0]
              )
          ),
          child: buildButton(context),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onClicked,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image ?? Container(),
              text != null? Text(
                text,
                style: WidgetUtils.getSmallTextBoldStyle(color: textColor),
              ): Container(),
              Opacity(
                opacity: 0,
                child: image ?? Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
