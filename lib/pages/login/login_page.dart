import 'package:amplify/constants/images.dart';
import 'package:amplify/route/app_routes.dart';
import 'package:amplify/sharedprefs/sp_util.dart';
import 'package:amplify/theme/colors.dart';
import 'package:amplify/utils/utils.dart';
import 'package:amplify/utils/widget_utils.dart';
import 'package:amplify/widgets/button_widget.dart';
import 'package:amplify/widgets/custom_text_form_field.dart';
import 'package:amplify/widgets/responsive_helper_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName, password;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode userNameNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  var onTapRecognizer;

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pushNamed(context, AppRoutes.socialSignup);
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: ResponsiveHelperWidget(
          mobileBody: buildForMobile(),
          tabletBody: buildForTablet(),
          desktopBody: buildForDesktop(),
        )));
  }

  Widget buildForMobile() {
    return SingleChildScrollView(
      child: Expanded(
        child: Form(
          key: loginFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Amplify',
                    style: WidgetUtils.getMediumTextItalicStyle(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'User Name',
                  style: WidgetUtils.getRegularTextStyle(),
                ),
                const SizedBox(height: 5),
                CustomTextFormField(
                  textColor: Colors.white,
                    onSaved: (value) => userName = value,
                    //textCapitalization: TextCapitalization.words,
                    controller: userNameController,
                    focusNode: userNameNode,
                    nextNode: passwordNode,
                    showCancelIcon: true,
                    decoration: InputDecoration(
                      hintText: 'Enter User Name',
                      hintStyle: WidgetUtils.getRegularHintTextStyle(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kThemeColor, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPaleGrey100, width: 1.5),
                      ),
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      contentPadding:
                          EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                    ),
                    validator: (value) {
                    userName = value;
                      return validateUserName(value);
                    }),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Password',
                  style: WidgetUtils.getRegularTextStyle(),
                ),
                const SizedBox(height: 5),
                CustomTextFormField(
                    textColor: Colors.white,
                    onSaved: (value) => password = value,
                    //textCapitalization: TextCapitalization.words,
                    controller: passwordController,
                    focusNode: passwordNode,
                    showCancelIcon: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      hintStyle: WidgetUtils.getRegularHintTextStyle(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kThemeColor, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPaleBlue100, width: 1.5),
                      ),
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      contentPadding:
                          EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      password = value;
                      return validatePassword(value);
                    }),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: WidgetUtils.getRegularTextAppThemeStyle(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonWidget(
                  text: 'LOG IN',
                  icon: null,
                  onClicked: () {
                      validateAndNavigate();
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                        kFacebookIcon,
                    height: 25,
                      width: 25,
                    ),
                    Text(
                      'Continue with Facebook',
                      style: WidgetUtils.getMediumTextAppThemeStyle(),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                        kGoogleIcon,
                      height: 25,
                      width: 25,
                    ),
                    Text(
                      'Continue with Google',
                      style: WidgetUtils.getMediumTextAppThemeStyle(),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  color: kThemeColor,
                  thickness: 1,
                  height: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Dont have an account?',
                        style: WidgetUtils.getRegularTextStyle(),
                        children: [
                          TextSpan(
                              text: 'Sign Up',
                              recognizer: onTapRecognizer,
                              style: WidgetUtils.getMediumTextAppThemeStyle())
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForTablet() {}

  Widget buildForDesktop() {}

  String validateUserName(String userName) {
    return userName.isEmpty ? 'Please enter User Name' : null;
  }

  String validatePassword(String password) {
    return password.isEmpty ? 'Please enter Password' : null;
  }

  void validateAndNavigate() async{
    /*final isValid = loginFormKey.currentState.validate();
    if (!isValid) {
      return false;
    } else {
      loginFormKey.currentState.save();
      return true;
    }*/
    await SpUtil.getInstance();
    Utils.print('check1: ${SpUtil.getString("userName")}');
    if(userName != null && userName.isNotEmpty){
      if(password != null && password.isNotEmpty){
        if(SpUtil.getString("userName") == userName) {
        if(SpUtil.getString("password") == password) {
          Navigator.pushNamedAndRemoveUntil(context,AppRoutes.home,(route) => false);
        }else{
          Utils.showSnackBar(context, 'Incorrect password');
        }
        }else {
          Utils.showSnackBar(context, 'Incorrect user name');
        }
      }else{
        Utils.showSnackBar(context, 'Please enter password');
      }
    }else{
      Utils.showSnackBar(context, 'Please enter user name');
    }
  }

}
