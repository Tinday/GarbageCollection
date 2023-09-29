import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garbage_control/application/redux/actions/update_admin_report_state_action.dart';
import 'package:garbage_control/application/redux/flags/app_flags.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/models/report.dart';

class FetchAdminReports extends ReduxAction<AppState> {
  FetchAdminReports({required this.onError});

  final void Function(String? error)? onError;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchAdminReportsFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchAdminReportsFlag));
  }

  @override
  Future<AppState?> reduce() async {
    await FirebaseFirestore.instance
        .collection('reports')
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> value) {
      final List<Report> reports = <Report>[];
      final List<Report> finalReports = <Report>[];

      for (final doc in value.docs) {
        reports.add(Report.fromJson(doc.data()));
      }

      for (int i = 0; i < reports.length; i++) {
        finalReports.add(reports[i].copyWith(id: value.docs[i].id));
      }
      dispatch(UpdateAdminReportStateAction(reports: finalReports));
    });

    return state;
  }
}
