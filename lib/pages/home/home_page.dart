import 'package:amplify/utils/widget_utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            'Welcome to Amplify!',
            style: WidgetUtils.getLargeTextStyle(color: Colors.white),
          )
        ),
      ),
    );
  }
}
