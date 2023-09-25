import 'package:async_redux/async_redux.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/models/user.dart';

class UserStateViewModel extends Vm {
  UserStateViewModel({
    this.user,
  }) : super(
          equals: <Object?>[user],
        );

  factory UserStateViewModel.fromStore(Store<AppState> store) {
    return UserStateViewModel(
      user: store.state.userState?.user,
    );
  }

  final UserModel? user;
}
