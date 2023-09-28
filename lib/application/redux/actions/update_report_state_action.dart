import 'package:async_redux/async_redux.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/models/report.dart';

class UpdateReportStateAction extends ReduxAction<AppState> {
  UpdateReportStateAction({
    this.reports,
    this.selectedReport,
    this.documentId,
  });

  final List<Report?>? reports;
  final Report? selectedReport;
  final String? documentId;

  @override
  AppState reduce() {
    final newReportState = state.reportsState?.copyWith(
      reports: reports ?? state.reportsState?.reports,
      selectedReport: selectedReport ?? state.reportsState?.selectedReport,
      documentId: documentId ?? state.reportsState?.documentId,
    );

    return state.copyWith.call(reportsState: newReportState);
  }
}
