import 'package:async_redux/async_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/application/redux/view_models/reports_view_model.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/models/report.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';
import 'package:intl/intl.dart';

class AdminReportDetailPage extends StatelessWidget {
  const AdminReportDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Admin Report Detail'),
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
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final DateTime now = DateTime.now();
                      final DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: now,
                        firstDate: now,
                        lastDate: now.add(const Duration(days: 1000)),
                      );
                      if (selectedDate != null) {
                        final String formattedDate =
                            DateFormat('dd-MM-yyyy').format(selectedDate);
                        await FirebaseFirestore.instance
                            .collection('reports')
                            .doc(selectedReport?.id)
                            .update({
                          'date_of_collection': formattedDate,
                          'is_scheduled': true,
                        });
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Collection date assigned'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a valid date'),
                          ),
                        );
                      }
                    },
                    child: const Text('Assign collection date'),
                  ),
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
