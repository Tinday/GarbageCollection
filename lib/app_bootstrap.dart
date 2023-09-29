import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garbage_control/app_widget.dart';
import 'package:garbage_control/application/core/utils.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';

Future<void> appBootStrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );

  final AppState initialState = AppState.initial();

  final Store<AppState> store = Store<AppState>(
    initialState: initialState,
    defaultDistinct: true,
  );

  final NavigatorObserver navigatorObserver = NavigatorObserver();
  NavigateAction.setNavigatorKey(appGlobalNavigatorKey);

  runApp(
    AppWidget(
      store: store,
      navigatorObserver: navigatorObserver,
      navigatorKey: appGlobalNavigatorKey,
    ),
  );
}
