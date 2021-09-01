import 'package:amplify/constants/constants.dart';
import 'package:flutter/material.dart';

/**
* Created by Bhagavan Byreddy on 16/08/21 10:42 AM.
*/


class ResponsiveHelperWidget extends StatelessWidget {

  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  const ResponsiveHelperWidget({
    Key key,
    this.mobileBody,
    this.tabletBody,
    this.desktopBody
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints){
          if(constraints.maxWidth < BreakPoints.tabletBreakPoint){
            return mobileBody;
          }else if(constraints.maxWidth >= BreakPoints.tabletBreakPoint &&
          constraints.maxWidth < BreakPoints.desktopBreakPoint){
            return tabletBody ?? mobileBody;
          }else{
            return desktopBody ?? mobileBody;
          }
        }
        );
  }
}
