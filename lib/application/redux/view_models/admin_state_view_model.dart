import 'package:async_redux/async_redux.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/models/report.dart';

class AdminStateViewModel extends Vm {
  AdminStateViewModel({
    this.reports,
    this.selectedReport,
    this.documentId,
    this.wait,
  }) : super(
          equals: <Object?>[reports, selectedReport, documentId, wait],
        );

  factory AdminStateViewModel.fromStore(Store<AppState> store) {
    return AdminStateViewModel(
      reports: store.state.adminState?.reportsState?.reports,
      selectedReport: store.state.adminState?.reportsState?.selectedReport,
      documentId: store.state.adminState?.reportsState?.documentId,
      wait: store.state.wait!,
    );
  }

  final List<Report?>? reports;
  final Report? selectedReport;
  final String? documentId;
  final Wait? wait;
}
