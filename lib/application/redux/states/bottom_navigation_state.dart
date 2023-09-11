import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_navigation_state.freezed.dart';
part 'bottom_navigation_state.g.dart';

@freezed
class BottomNavigationState with _$BottomNavigationState {
  factory BottomNavigationState({
    int? selectedIndex,
  }) = _BottomNavigationState;

  factory BottomNavigationState.fromJson(Map<String, dynamic> json) =>
      _$BottomNavigationStateFromJson(json);

  factory BottomNavigationState.initial() => BottomNavigationState(
        selectedIndex: 0,
      );
}
