// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/models/user.dart';

class UpdateUserStateAction extends ReduxAction<AppState> {
  UpdateUserStateAction({
    this.userModel,
  });

  final UserModel? userModel;

  @override
  AppState reduce() {
    final newUserState =
        state.userState?.copyWith(user: userModel ?? state.userState?.user);

    return state.copyWith.call(userState: newUserState);
  }
}
