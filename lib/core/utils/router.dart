import 'package:flutter/material.dart';
import 'package:square/features/authentication/presentation/pages/login_page.dart';
import 'package:square/features/entreprise/presentation/pages/entreprises_page.dart';
import 'constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_ROUTE:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case ENTREPRISES:
        return MaterialPageRoute(builder: (_) => const EntreprisesPage());

      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}
