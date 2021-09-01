import 'package:amplify/l10n/l10n.dart';
import 'package:amplify/pages/home/home_page.dart';
import 'package:amplify/pages/signup/email_signup_page.dart';
import 'package:amplify/pages/login/login_page.dart';
import 'package:amplify/pages/signup/social_signup_page.dart';
import 'package:amplify/provider/locale_provider.dart';
import 'package:amplify/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(
              context); // we can change language by calling "provider.setLocale(locale);"
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Amplify App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: getInitialRoute(),
            onGenerateRoute: (route) => getRoute(route),
          );
        });
  }

  String getInitialRoute() => AppRoutes.login;

  Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return buildRoute(LoginPage(), settings: settings);
      case AppRoutes.socialSignup:
        return buildRoute(SocialSignupPage(), settings: settings);
      case AppRoutes.emailSignup:
        return buildRoute(EmailSignupPage(), settings: settings);
      case AppRoutes.home:
        return buildRoute(HomePage(), settings: settings);
      default:
        return null;
    }
  }

  MaterialPageRoute buildRoute(Widget child, {RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => child,
      );
}
