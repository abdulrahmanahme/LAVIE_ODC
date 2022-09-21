
import 'package:flutter/material.dart';

import '../layout/layout_screen.dart';
import '../screens_and_cubit/auth/login/login_screen.dart';
import '../screens_and_cubit/auth/sginUp_screen.dart/signUp_screen.dart';
import '../screens_and_cubit/home/home.dart';


class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String homeRoute = "/home";
  static const String webLayoutRoute = "/webLayOut";
  static const String mobileLayoutRoute = "/mobileLayOut";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.splashRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const SplashScreen(),
      //   );
      // case Routes.webLayoutRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const WebLayoutScreen(),
      //   );
      // case Routes.mobileLayoutRoute:
      //   return MaterialPageRoute(
      //     builder: (_) =>  LayoutScreen(),
      //   );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) =>  LoginScreen(),
        );
      // case Routes.registerRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const SingUp(),
      //   );
      // case Routes.forgetPasswordRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgetPasswordScreen(),
      //   );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) =>  HomeScreen (),
        );
      default:
        return unDefiendRoute();
    }
  }

  static Route<dynamic> unDefiendRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Not found'),
        ),
        body: Center(
          child: Text('Not found')
        ),
      ),
    );
  }
}