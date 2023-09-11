import 'package:flutter/material.dart';
import 'package:garbage_control/presentation/core/routes.dart';
import 'package:garbage_control/presentation/discover/pages/discover_page.dart';
import 'package:garbage_control/presentation/onboarding/pages/create_account_page.dart';
import 'package:garbage_control/presentation/home_page/pages/home_page.dart';
import 'package:garbage_control/presentation/onboarding/pages/login_page.dart';
import 'package:garbage_control/presentation/onboarding/pages/welcome_page.dart';
import 'package:garbage_control/presentation/profile/pages/profile_page.dart';
import 'package:garbage_control/presentation/report/pages/report_page.dart';

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

      case homePageRoute:
        return MaterialPageRoute<HomePage>(
          builder: (_) => const HomePage(),
          settings: const RouteSettings(name: homePageRoute),
        );
      case profilePageRoute:
        return MaterialPageRoute<ProfilePage>(
          builder: (_) => const ProfilePage(),
          settings: const RouteSettings(name: profilePageRoute),
        );
      case discoverRoute:
        return MaterialPageRoute<DiscoverPage>(
          builder: (_) => const DiscoverPage(),
          settings: const RouteSettings(name: discoverRoute),
        );
      case reportDumpingRoute:
        return MaterialPageRoute<ReportPage>(
          builder: (_) => const ReportPage(),
          settings: const RouteSettings(name: reportDumpingRoute),
        );
      case scheduleRoute:
        return MaterialPageRoute<ReportPage>(
          builder: (_) => const ReportPage(),
          settings: const RouteSettings(name: scheduleRoute),
        );
      default:
        return MaterialPageRoute<WelcomePage>(
          builder: (_) => const WelcomePage(),
          settings: const RouteSettings(name: welcomePageRoute),
        );
    }
  }
}
