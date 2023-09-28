import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garbage_control/models/report.dart';

part 'reports_state.freezed.dart';
part 'reports_state.g.dart';

@freezed
class ReportsState with _$ReportsState {
  factory ReportsState({
    List<Report?>? reports,
    Report? selectedReport,
    String? documentId,
  }) = _ReportsState;

  factory ReportsState.fromJson(Map<String, dynamic> json) =>
      _$ReportsStateFromJson(json);

  factory ReportsState.initial() => ReportsState(reports: []);
}
