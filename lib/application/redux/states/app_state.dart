// ignore_for_file: invalid_annotation_target

import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garbage_control/application/redux/states/admin_state.dart';
import 'package:garbage_control/application/redux/states/bottom_navigation_state.dart';
import 'package:garbage_control/application/redux/states/reports_state.dart';
import 'package:garbage_control/application/redux/states/user_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

// AppState assembles all features states into one that can the pushed during creation
// to create on global app store
@freezed
class AppState with _$AppState {
  factory AppState({
    UserState? userState,
    BottomNavigationState? bottomNavigationState,
    ReportsState? reportsState,
    AdminState? adminState,
    @JsonKey(includeFromJson: false, includeToJson: false) Wait? wait,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial() => AppState(
        userState: UserState.initial(),
        bottomNavigationState: BottomNavigationState.initial(),
        reportsState: ReportsState.initial(),
        adminState: AdminState.initial(),
        wait: Wait(),
      );
}
