import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';


import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/presentation/core/router.dart';
import 'package:garbage_control/presentation/onboarding/pages/welcome_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    Key? key,
    required this.store,
    required this.navigatorKey,
    required this.navigatorObserver,
  }) : super(key: key);

  final Store<AppState> store;
  final GlobalKey<NavigatorState> navigatorKey;
  final NavigatorObserver navigatorObserver;

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: appName,
        theme: appTheme,
        navigatorKey: navigatorKey,
        navigatorObservers: <NavigatorObserver>[
          navigatorObserver,
        ],
        home: const WelcomePage(),
        onGenerateRoute: appRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
