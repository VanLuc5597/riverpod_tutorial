import 'package:clone_riverpod_hooks/global/ultil/app_routes.dart';
import 'package:clone_riverpod_hooks/login/view/login_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.logInPage:
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Text("Error"),
      );
    });
  }
}
