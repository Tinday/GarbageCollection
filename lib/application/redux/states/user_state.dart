import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garbage_control/models/user.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    String? documentId,
    UserModel? user,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  factory UserState.initial() => UserState(
        documentId: '',
        user: UserModel.initial(),
      );
}
