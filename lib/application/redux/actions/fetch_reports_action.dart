import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/application/redux/actions/update_report_state_action.dart';
import 'package:garbage_control/application/redux/flags/app_flags.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/models/report.dart';

class FetchReports extends ReduxAction<AppState> {
  FetchReports({
    required this.onError,
    required this.context,
  });

  final void Function(String? error)? onError;
  final BuildContext context;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchReportsFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchReportsFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String reporter = state.userState?.documentId ?? '';
    await FirebaseFirestore.instance
        .collection('reports')
        .where('reporter', isEqualTo: reporter)
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> value) {
      final List<Report> reports = <Report>[];
      for (final doc in value.docs) {
        reports.add(Report.fromJson(doc.data()));
      }

      StoreProvider.dispatch(
        context,
        UpdateReportStateAction(reports: reports),
      );
    });

    return state;
  }
}
