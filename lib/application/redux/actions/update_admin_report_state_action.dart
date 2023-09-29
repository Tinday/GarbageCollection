import 'package:async_redux/async_redux.dart';
import 'package:garbage_control/application/redux/states/admin_report_state.dart';
import 'package:garbage_control/application/redux/states/admin_state.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/models/report.dart';

class UpdateAdminReportStateAction extends ReduxAction<AppState> {
  UpdateAdminReportStateAction({
    this.reports,
    this.selectedReport,
    this.documentId,
  });

  final List<Report?>? reports;
  final Report? selectedReport;
  final String? documentId;

  @override
  AppState reduce() {
    final AdminReportState? newAdminReportState =
        state.adminState?.reportsState?.copyWith(
      reports: reports ?? state.reportsState?.reports,
      selectedReport: selectedReport ?? state.reportsState?.selectedReport,
      documentId: documentId ?? state.reportsState?.documentId,
    );

    final AdminState? adminState =
        state.adminState?.copyWith.call(reportsState: newAdminReportState);

    return state.copyWith.call(adminState: adminState);
  }
}
