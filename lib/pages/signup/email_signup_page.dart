import 'package:amplify/route/app_routes.dart';
import 'package:amplify/sharedprefs/sp_util.dart';
import 'package:amplify/theme/colors.dart';
import 'package:amplify/utils/utils.dart';
import 'package:amplify/utils/widget_utils.dart';
import 'package:amplify/widgets/button_widget.dart';
import 'package:amplify/widgets/custom_text_form_field.dart';
import 'package:amplify/widgets/responsive_helper_widget.dart';
import 'package:flutter/material.dart';

class EmailSignupPage extends StatefulWidget {
  @override
  _EmailSignupPageState createState() => _EmailSignupPageState();
}

class _EmailSignupPageState extends State<EmailSignupPage> {
  String emailAddress,password,confirmPassword;

  var _timeGaps = [
    "Daily",
    "Only Weekends",
    "Once in a week",
    "Once in a month"
  ];
  String currentSelectedValue;
  int radioValue = 0;

  bool isPref1Visible = true;
  bool isPref2Visible = false;

  final PageController pageController = PageController(initialPage: 0);
  GlobalKey<FormState> emailSignupFormKey = GlobalKey<FormState>();

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
          key: emailSignupFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 30),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 5),
               Container(
                 height: 650,
                 child: PageView(
                   //physics: NeverScrollableScrollPhysics(), // to disable horizontal scroll
                   scrollDirection: Axis.horizontal,
                   controller: pageController,
                   children: [
                     Expanded(
                       child: Center(
                         child: buildPref1(context),
                       ),
                     ),
                     Expanded(
                       child: Center(
                         child: buildPref2(context),
                       ),
                     ),
                   ],
                 ),
               ),
            ]
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForTablet() {}

  Widget buildForDesktop() {}

  Widget buildPref1(BuildContext context) {
    return Stack(
      children: [
       Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(children: [
                  SizedBox(height: 20),
                  Container(
                    //alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SIGN UP',
                            style: WidgetUtils.getLargeTextStyle(
                                color: kThemeColor),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: kThemeColor),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 7, right: 7, top: 2, bottom: 2),
                              child: Text(
                                '1 of 2',
                                style: WidgetUtils.getSmallTextBoldStyle(
                                    color: Colors.black),
                              ),
                            ),
                          )
                        ]),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 5, right: 5),
                              height: 6,
                              //width: 80,
                              decoration: BoxDecoration(
                                color: kThemeColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 3, right: 5),
                              height: 6,
                              //width: 80,
                              decoration: BoxDecoration(
                                  color: kThemeColor50,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5))),
                            ),
                          )
                        ]),
                  ),
                  const SizedBox(height: 20),
                ]),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'What is your Email?',
                      style: WidgetUtils.getMediumTextBoldStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    CustomTextFormField(
                      textColor: Colors.black,
                        onSaved: (value) => emailAddress = value,
                        //textCapitalization: TextCapitalization.words,
                        showCancelIcon: true,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: WidgetUtils.getRegularHintTextStyle(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kThemeColor, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kGrey140, width: 1),
                          ),
                          fillColor: kPaleGrey200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              bottom: 10.0, left: 10.0, right: 10.0),
                        ),
                        validator: (value) {
                        emailAddress = value;
                          return validateEmail(value);
                        }),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'What is your Gender?',
                      style: WidgetUtils.getMediumTextBoldStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          Radio(
                            value: 0,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChange,
                            activeColor: kThemeColor,
                          ),
                          Text(
                            'Male',
                            style: WidgetUtils.getRegularTextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Radio(
                            value: 1,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChange,
                            activeColor: kThemeColor,
                          ),
                          Text(
                            'Female',
                            style: WidgetUtils.getRegularTextStyle(color: Colors.black),
                          ),
                              SizedBox(
                                width: 10,
                              ),
                          Radio(
                            value: 2,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChange,
                            activeColor: kThemeColor,
                          ),
                          Text(
                            'Other',
                            style: WidgetUtils.getRegularTextStyle(color: Colors.black),
                          ),
                        ])),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How much do you train?',
                        style:
                            WidgetUtils.getMediumTextBoldStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 5),
                    FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kPurple100, width: 0.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kGrey300, width: 0.5),
                            ),
                            fillColor: kPaleGrey200,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                            filled: true,
                            contentPadding: EdgeInsets.only(
                                bottom: 10.0, left: 10.0, right: 10.0),
                            hintText: 'Select time gap',
                            hintStyle: WidgetUtils.getRegularHintTextStyle(),
                          ),
                          isEmpty: currentSelectedValue == null ||
                              currentSelectedValue == '',
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                            style: Theme.of(context).textTheme.bodyText1,
                            icon: Icon(Icons.keyboard_arrow_down),
                            value: currentSelectedValue,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                currentSelectedValue = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _timeGaps.map((String type) {
                              return DropdownMenuItem<String>(
                                value: type,
                                child: Text(
                                    type,
                                  style: WidgetUtils.getRegularTextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                          )),
                        );
                      },
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: ButtonWidget(
            text: 'NEXT',
            icon: null,
            onClicked: () {
              checkValidationAndGo();
            },
          ),
        )
    ]
    );
  }

  void handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  Widget buildPref2(BuildContext context) {
    return Stack(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Column(children: [
                      SizedBox(height: 20),
                      Container(
                        //alignment: Alignment.centerLeft,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SIGN UP',
                                style: WidgetUtils.getLargeTextStyle(
                                    color: kThemeColor),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                    color: kThemeColor),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 7, right: 7, top: 2, bottom: 2),
                                  child: Text(
                                    '2 of 2',
                                    style: WidgetUtils.getSmallTextBoldStyle(
                                        color: Colors.black),
                                  ),
                                ),
                              )
                            ]),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  height: 6,
                                  //width: 80,
                                  decoration: BoxDecoration(
                                    color: kThemeColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5)),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 3, right: 5),
                                  height: 6,
                                  //width: 80,
                                  decoration: BoxDecoration(
                                      color: kThemeColor,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5))),
                                ),
                              )
                            ]),
                      ),
                      const SizedBox(height: 20),
                    ]),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Password',
                          style: WidgetUtils.getRegularTextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 5),
                        CustomTextFormField(
                            textColor: Colors.black,
                            onSaved: (value) => password = value,
                            //textCapitalization: TextCapitalization.words,
                            //showCancelIcon: true,
                            showEyeIcon: true,
                            decoration: InputDecoration(
                              hintText: 'Enter password',
                              hintStyle: WidgetUtils.getRegularHintTextStyle(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: kThemeColor, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: kGrey140, width: 1),
                              ),
                              fillColor: kPaleGrey200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              filled: true,
                              contentPadding: EdgeInsets.only(
                                  bottom: 10.0, left: 10.0, right: 10.0),
                            ),
                            validator: (value) {
                              password = value;
                              return validatePassword(value);
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Confirm Password',
                          style: WidgetUtils.getRegularTextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 5),
                        CustomTextFormField(
                            textColor: Colors.black,
                            onSaved: (value) => confirmPassword = value,
                            //textCapitalization: TextCapitalization.words,
                            //showCancelIcon: true,
                            showEyeIcon: true,
                            decoration: InputDecoration(
                              hintText: 'Enter confirm password',
                              hintStyle: WidgetUtils.getRegularHintTextStyle(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: kThemeColor, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: kGrey140, width: 1),
                              ),
                              fillColor: kPaleGrey200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              filled: true,
                              contentPadding: EdgeInsets.only(
                                  bottom: 10.0, left: 10.0, right: 10.0),
                            ),
                            validator: (value) {
                              confirmPassword = value;
                              return validateConfirmPassowrd(value);
                            }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ButtonWidget(
              text: 'CONTINUE',
              icon: null,
              onClicked: () {
                checkValidationAndSignup();
              },
            ),
          )
        ]
    );
  }

  String validateEmail(String email) {
    if (email.isEmpty) {
      return 'Please enter Email';
    }
    return Utils.validateEmail(email);
  }

  void checkValidationAndGo() {
   if(emailAddress.isNotEmpty){
     if(Utils.validateEmail(emailAddress) == null) {
       pageController.nextPage(
           duration: Duration(milliseconds: 800),
           curve: Curves.easeIn
       );
     }else{
       Utils.showSnackBar(context, 'Please enter a valid email address.');
     }
    }else{
     Utils.showSnackBar(context, 'Please enter Email.');
   }
  }

  String validatePassword(String password) {
    if(password.isEmpty){
      return 'Please enter password';
    }else if(password.length < 5){
      return 'Please enter minimum 5 characters';
    }
    return null;
  }

  String validateConfirmPassowrd(String cPassword) {
    if(password.isEmpty){
      return 'Please enter password';
    }else if(password.length < 5){
      return 'Password should contain atleast 5 characters';
    }else if(cPassword.isEmpty){
      return 'Please enter confirm password';
    }else if(cPassword.length < 5){
      return 'Confirm password should contain atleast 5 characters';
    }else if(password != cPassword){
      return 'Password and Confirm Password should be same';
    }
    return null;
  }

  void checkValidationAndSignup() async{
    await SpUtil.getInstance();
    if(password.isNotEmpty){
      if(password.length >= 5){
        if(confirmPassword.isNotEmpty){
          if(confirmPassword.length >= 5){
            if(password == confirmPassword){
              SpUtil.putString("userName", emailAddress);
              SpUtil.putString("password", password);
              Utils.showSnackBar(context, 'Thanks for Signup!');
              Navigator.pushNamedAndRemoveUntil(context,AppRoutes.home,(route) => false);
            }else{
              Utils.showSnackBar(context, 'Password and Confirm Password should be same');
            }
          }else{
            Utils.showSnackBar(context, 'Confirm password should contain atleast 5 characters');
          }
        }else{
          Utils.showSnackBar(context, 'Please enter confirm password');
        }
      }else{
        Utils.showSnackBar(context, 'Password should contain atleast 5 characters');
      }

    }else{
      Utils.showSnackBar(context, 'Please enter password');
    }
  }
}
