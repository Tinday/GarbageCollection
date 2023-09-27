import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/application/redux/actions/fetch_reports_action.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/application/redux/view_models/reports_view_model.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/presentation/core/routes.dart';
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
            store.dispatch(
              FetchReports(
                onError: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('An error occurred when fetching reports'),
                    ),
                  );
                },
                context: context,
              ),
            );
          },
          builder: (BuildContext context, ReportsViewModel vm) {
            if (vm.reports?.isNotEmpty ?? false) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Send to my email'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: vm.reports?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.of(context).pushNamed(reportDetailRoute);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(
                                vertical: 24, horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    const Text(
                                      "Area of reporting/dumping: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: accentColor),
                                    ),
                                    Text(
                                      vm.reports?[index]?.addressOfDumping ??
                                          '',
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.chevron_right)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text('You have not filed any reports so far'),
              );
            }
          },
        ),
      ),
    );
  }
}
