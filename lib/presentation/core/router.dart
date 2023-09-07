import 'package:flutter/material.dart';
import 'package:garbage_control/presentation/core/routes.dart';
import 'package:garbage_control/presentation/onboarding/pages/create_account_page.dart';
import 'package:garbage_control/presentation/onboarding/pages/login_page.dart';
import 'package:garbage_control/presentation/onboarding/pages/welcome_page.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings? routeSettings) {
    switch (routeSettings?.name) {
      case welcomePageRoute:
        return MaterialPageRoute<WelcomePage>(
          builder: (_) => const WelcomePage(),
          settings: const RouteSettings(name: welcomePageRoute),
        );
      case loginPageRoute:
        return MaterialPageRoute<LoginPage>(
          builder: (_) => const LoginPage(),
          settings: const RouteSettings(name: loginPageRoute),
        );
      case createAccountPageRoute:
        return MaterialPageRoute<CreateAccountPage>(
          builder: (_) => const CreateAccountPage(),
          settings: const RouteSettings(name: createAccountPageRoute),
        );
      default:
        return MaterialPageRoute<WelcomePage>(
          builder: (_) => const WelcomePage(),
          settings: const RouteSettings(name: welcomePageRoute),
        );
    }
  }
}
