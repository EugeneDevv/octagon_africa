// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:octagon_africa/presentation/home/home_page.dart';
import 'package:octagon_africa/presentation/login/login_page.dart';
import 'package:octagon_africa/presentation/register/register_page.dart';
import 'package:octagon_africa/presentation/router/routes.dart';

class AppRouter {
  /// gets the current route based on the [RouteSettings]
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final dynamic args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.homePage:
        return MaterialPageRoute<HomePage>(
          builder: (_) => HomePage(),
        );

      case AppRoutes.loginPage:
        return MaterialPageRoute<LoginPage>(
          builder: (_) => const LoginPage(),
        );
      case AppRoutes.registerPage:
        return MaterialPageRoute<RegisterPage>(
          builder: (_) => const RegisterPage(),
        );

      default:
        return MaterialPageRoute<LoginPage>(
          builder: (_) => const LoginPage(),
        );
    }
  }
}
