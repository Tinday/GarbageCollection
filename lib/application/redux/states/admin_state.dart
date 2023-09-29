import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garbage_control/application/redux/states/admin_report_state.dart';

part 'admin_state.freezed.dart';
part 'admin_state.g.dart';

@freezed
class AdminState with _$AdminState {
  factory AdminState({
    AdminReportState? reportsState,
  }) = _AdminState;

  factory AdminState.fromJson(Map<String, dynamic> json) =>
      _$AdminStateFromJson(json);

  factory AdminState.initial() => AdminState(
        reportsState: AdminReportState.initial(),
      );
}
