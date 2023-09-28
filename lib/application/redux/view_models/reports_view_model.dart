import 'package:async_redux/async_redux.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/models/report.dart';

class ReportsViewModel extends Vm {
  ReportsViewModel({
    this.reports,
    this.selectedReport,
    this.documentId,
    this.wait,
  }) : super(
          equals: <Object?>[reports, selectedReport, documentId, wait],
        );

  factory ReportsViewModel.fromStore(Store<AppState> store) {
    return ReportsViewModel(
      reports: store.state.reportsState?.reports,
      selectedReport: store.state.reportsState?.selectedReport,
      documentId: store.state.reportsState?.documentId,
      wait: store.state.wait!,
    );
  }

  final List<Report?>? reports;
  final Report? selectedReport;
  final String? documentId;
  final Wait? wait;
}
