import 'package:flutter/material.dart';
import 'package:garbage_control/models/tutorial.dart';
import 'package:garbage_control/presentation/core/routes.dart';
import 'package:garbage_control/presentation/discover/pages/discover_page.dart';
import 'package:garbage_control/presentation/discover/pages/video_player_page.dart';
import 'package:garbage_control/presentation/home_page/pages/admin_home_page.dart';
import 'package:garbage_control/presentation/onboarding/pages/admin_login_page.dart';
import 'package:garbage_control/presentation/onboarding/pages/create_account_page.dart';
import 'package:garbage_control/presentation/home_page/pages/home_page.dart';
import 'package:garbage_control/presentation/onboarding/pages/forgot_password_page.dart';
import 'package:garbage_control/presentation/onboarding/pages/login_page.dart';
import 'package:garbage_control/presentation/onboarding/pages/reset_email_sent_page.dart';
import 'package:garbage_control/presentation/onboarding/pages/welcome_page.dart';
import 'package:garbage_control/presentation/profile/pages/change_email_page.dart';
import 'package:garbage_control/presentation/profile/pages/change_password_page.dart';
import 'package:garbage_control/presentation/profile/pages/change_user_name_page.dart';
import 'package:garbage_control/presentation/profile/pages/profile_page.dart';
import 'package:garbage_control/presentation/report/pages/admin_report_detail_page.dart';
import 'package:garbage_control/presentation/report/pages/admin_reports_list_page.dart';
import 'package:garbage_control/presentation/report/pages/edit_report_page.dart';
import 'package:garbage_control/presentation/report/pages/report_detail_page.dart';
import 'package:garbage_control/presentation/report/pages/report_page.dart';
import 'package:garbage_control/presentation/report/pages/reports_list_page.dart';

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

      case forgotPasswordPageRoute:
        return MaterialPageRoute<ForgotPasswordPage>(
          builder: (_) => const ForgotPasswordPage(),
          settings: const RouteSettings(name: forgotPasswordPageRoute),
        );

      case resetEmailSentPageRoute:
        return MaterialPageRoute<ResetEmailSentPage>(
          builder: (_) => const ResetEmailSentPage(),
          settings: const RouteSettings(name: resetEmailSentPageRoute),
        );

      case changePasswordRoute:
        return MaterialPageRoute<ChangePasswordPage>(
          builder: (_) => const ChangePasswordPage(),
          settings: const RouteSettings(name: changePasswordRoute),
        );
      case changeEmailRoute:
        return MaterialPageRoute<ChangeEmailPage>(
          builder: (_) => const ChangeEmailPage(),
          settings: const RouteSettings(name: changeEmailRoute),
        );

      case changeUserNameRoute:
        return MaterialPageRoute<ChangeUserNamePage>(
          builder: (_) => const ChangeUserNamePage(),
          settings: const RouteSettings(name: changeUserNameRoute),
        );

      case videoPlayerPageRoute:
        final dynamic args = routeSettings?.arguments;

        return MaterialPageRoute<VideoPlayerPage>(
          builder: (_) => VideoPlayerPage(
            tutorial: args as Tutorial,
          ),
          settings: const RouteSettings(name: videoPlayerPageRoute),
        );

      case reportsListRoute:
        return MaterialPageRoute<ReportsListPage>(
          builder: (_) => const ReportsListPage(),
          settings: const RouteSettings(name: reportsListRoute),
        );

      case reportDetailRoute:
        return MaterialPageRoute<ReportDetailPage>(
          builder: (_) => const ReportDetailPage(),
          settings: const RouteSettings(name: reportDetailRoute),
        );

      case editReportRoute:
        final dynamic args = routeSettings?.arguments;

        return MaterialPageRoute<EditReportPage>(
          builder: (_) => EditReportPage(report: args),
          settings: const RouteSettings(name: editReportRoute),
        );

      case adminLoginRoute:
        return MaterialPageRoute<AdminLoginPage>(
          builder: (_) => const AdminLoginPage(),
          settings: const RouteSettings(name: adminLoginRoute),
        );

      case adminHomePageRoute:
        return MaterialPageRoute<AdminHomePage>(
          builder: (_) => const AdminHomePage(),
          settings: const RouteSettings(name: adminHomePageRoute),
        );

      case adminReportsPageRoute:
        return MaterialPageRoute<AdminReportsListPage>(
          builder: (_) => const AdminReportsListPage(),
          settings: const RouteSettings(name: adminReportsPageRoute),
        );

      case adminReportDetailPageRoute:
        return MaterialPageRoute<AdminReportDetailPage>(
          builder: (_) => const AdminReportDetailPage(),
          settings: const RouteSettings(name: adminReportDetailPageRoute),
        );

      default:
        return MaterialPageRoute<WelcomePage>(
          builder: (_) => const WelcomePage(),
          settings: const RouteSettings(name: welcomePageRoute),
        );
    }
  }
}
