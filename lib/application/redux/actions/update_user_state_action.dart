import 'package:async_redux/async_redux.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/application/redux/states/user_state.dart';
import 'package:garbage_control/models/user.dart';

class UpdateUserStateAction extends ReduxAction<AppState> {
  UpdateUserStateAction({
    this.userModel,
    this.documentId,
  });

  final UserModel? userModel;
  final String? documentId;

  @override
  AppState reduce() {
    final UserState? newUserState = state.userState?.copyWith(
      user: userModel ?? state.userState?.user,
      documentId: documentId ?? state.userState?.documentId,
    );

    return state.copyWith.call(userState: newUserState);
  }
}
