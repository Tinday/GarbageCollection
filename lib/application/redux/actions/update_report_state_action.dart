import 'package:async_redux/async_redux.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/models/report.dart';

class UpdateReportStateAction extends ReduxAction<AppState> {
  UpdateReportStateAction({
    this.reports,
  });

  final List<Report?>? reports;

  @override
  AppState reduce() {
    final newReportState = state.reportsState?.copyWith(
      reports: reports ?? state.reportsState?.reports,
    );

    return state.copyWith.call(reportsState: newReportState);
  }
}
