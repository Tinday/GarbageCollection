import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/application/redux/actions/fetch_reports_action.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/application/redux/view_models/bottom_app_state_view_model.dart';
import 'package:garbage_control/application/redux/view_models/reports_view_model.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';

class ReportsListPage extends StatefulWidget {
  const ReportsListPage({Key? key}) : super(key: key);

  @override
  State<ReportsListPage> createState() => _ReportsListPageState();
}

class _ReportsListPageState extends State<ReportsListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Report Dumping'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: StoreConnector<AppState, ReportsViewModel>(
          converter: (Store<AppState> store) =>
              ReportsViewModel.fromStore(store),
          onInit: (store) {
            store.dispatch(FetchReports(
              onError: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('An error occurered when fetching reports'),
                  ),
                );
              },
              context: context,
            ));
          },
          builder: (BuildContext context, ReportsViewModel vm) {
            if (vm.reports?.isNotEmpty ?? false) {
              return ListView.builder(
                itemCount: vm.reports?.length,
                itemBuilder: (BuildContext context, int index) {},
              );
            } else {
              return Center(
                  child: Text('You have not filed any reports so far'));
            }
          },
        ),
      ),
    );
  }
}
