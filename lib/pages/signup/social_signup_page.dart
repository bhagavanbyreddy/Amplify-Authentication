import 'package:amplify/constants/images.dart';
import 'package:amplify/pages/signup/social_signup_arguments.dart';
import 'package:amplify/route/app_routes.dart';
import 'package:amplify/theme/colors.dart';
import 'package:amplify/utils/widget_utils.dart';
import 'package:amplify/widgets/login_button.dart';
import 'package:amplify/widgets/responsive_helper_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SocialSignupPage extends StatefulWidget {

  /*final SocialSignupArguments arguments;

  const SocialSignupPage({
    required this.arguments,
     Key? key,
  }) : super(key: key);

  while sending args > final args = SocialSignupArguments(
                      username: 'Bhagavan', password: '12345');

                  Navigator.pushNamed(
                    context,
                    AppRoutes.home,
                    arguments: args,
                  );
  we receiving arguments >  "arguments.username"
  */



  @override
  _SocialSignupPageState createState() => _SocialSignupPageState();
}

class _SocialSignupPageState extends State<SocialSignupPage> {
  var onTapRecognizer;

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(context).pop();
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
            )
        )
    );
  }

  Widget buildForMobile() {
    return SingleChildScrollView(
      child: Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
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
              Container(
                alignment: Alignment.center,
                child: Text(
                  'GAIN BACK CONTROL',
                  style: WidgetUtils.getMediumTextBoldStyle(),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'OF YOUR LIFE',
                  style: WidgetUtils.getMediumTextBoldStyle(),
                ),
              ),
              const SizedBox(height: 35),
              LoginButton(
                text: 'SIGN UP WITH FACEBOOK',
                color: kblue200,
                image: Image.asset(
                    kFacebookIcon,
                  height: 20,
                  width: 20,
                ),
                textColor: Colors.white,
                onClicked: () {},
              ),
              SizedBox(
                height: 22,
              ),
              LoginButton(
                text: 'SIGN UP WITH GOOGLE',
                color: Colors.white,
                image: Image.asset(
                    kGoogleIcon,
                  height: 20,
                  width: 20,
                ),
                textColor: Colors.black,
                onClicked: () {
                  //_goToNameInputScreen(context);
                },
              ),
              SizedBox(
                height: 35,
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context,AppRoutes.emailSignup);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign up with Email Address',
                    style: WidgetUtils.getRegularTextAppThemeStyle(),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
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
                      text: 'Already have an account?',
                      style:  WidgetUtils.getRegularTextStyle(),
                      children: [
                        TextSpan(
                            text: 'Sign in',
                            recognizer: onTapRecognizer,
                            style: WidgetUtils.getMediumTextAppThemeStyle()
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForTablet() {}

  Widget buildForDesktop() {}
}
