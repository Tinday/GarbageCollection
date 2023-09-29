import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garbage_control/models/report.dart';

part 'admin_report_state.freezed.dart';
part 'admin_report_state.g.dart';

@freezed
class AdminReportState with _$AdminReportState {
  factory AdminReportState({
    List<Report?>? reports,
    Report? selectedReport,
    String? documentId,
  }) = _AdminReportState;

  factory AdminReportState.fromJson(Map<String, dynamic> json) =>
      _$AdminReportStateFromJson(json);

  factory AdminReportState.initial() => AdminReportState(reports: []);
}
