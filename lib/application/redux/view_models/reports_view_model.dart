import 'package:async_redux/async_redux.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/models/report.dart';

class ReportsViewModel extends Vm {
  ReportsViewModel({
    this.reports,
  }) : super(equals: <Object?>[reports]);

  factory ReportsViewModel.fromStore(Store<AppState> store) {
    return ReportsViewModel(
      reports: store.state.reportsState?.reports,
    );
  }

  final List<Report?>? reports;
}
