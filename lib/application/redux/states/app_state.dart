// ignore_for_file: invalid_annotation_target

import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

// AppState assembles all features states into one that can the pushed during creation
// to create on global app store
@freezed
class AppState with _$AppState {
  factory AppState({
    // AuthCredentialsState? authCredentialsState,
    // UserState? userState,
    @JsonKey(includeFromJson: false, includeToJson: false) Wait? wait,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial() => AppState(
        // authCredentialsState: AuthCredentialsState.initial(),
        // userState: UserState.initial(),
        wait: Wait(),
      );
}
