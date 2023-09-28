import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/application/redux/view_models/reports_view_model.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/models/report.dart';
import 'package:garbage_control/presentation/core/routes.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';
import 'package:garbage_control/presentation/report/widgets/delete_report_dialog.dart';

class ReportDetailPage extends StatelessWidget {
  const ReportDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Report Detail'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: StoreConnector<AppState, ReportsViewModel>(
          converter: (Store<AppState> store) =>
              ReportsViewModel.fromStore(store),
          builder: (BuildContext context, ReportsViewModel vm) {
            final Report? selectedReport = vm.selectedReport;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            const Text(
                              'Area of dumping: ',
                              style: TextStyle(
                                fontSize: 18,
                                color: accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              selectedReport?.addressOfDumping ?? '',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Text(
                              'Reporter: ',
                              style: TextStyle(
                                fontSize: 18,
                                color: accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('You', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text(
                              'House Waste: ',
                              style: TextStyle(
                                fontSize: 18,
                                color: accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              (selectedReport?.isHouseWaste ?? false)
                                  .toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text(
                              'Construction waste: ',
                              style: TextStyle(
                                fontSize: 18,
                                color: accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                (selectedReport?.isConstructionWaste ?? false)
                                    .toString(),
                                style: const TextStyle(fontSize: 15)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text(
                              'Industrial waste: ',
                              style: TextStyle(
                                fontSize: 18,
                                color: accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                (selectedReport?.isIndustrialWaste ?? false)
                                    .toString(),
                                style: const TextStyle(fontSize: 15)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text(
                              'Electronic waste: ',
                              style: TextStyle(
                                fontSize: 18,
                                color: accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                (selectedReport?.isElectronicWaste ?? false)
                                    .toString(),
                                style: const TextStyle(fontSize: 15)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: accentColor,
                          side:
                              const BorderSide(color: accentColor, width: 1.5),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return DeleteReportDialog(
                                report: selectedReport!,
                              );
                            },
                          );
                        },
                        child: const Text('Delete dumping report'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            editReportRoute,
                            arguments: selectedReport,
                          );
                        },
                        child: const Text('Edit report'),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
