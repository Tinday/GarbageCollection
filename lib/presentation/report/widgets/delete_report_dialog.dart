import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/models/report.dart';

class DeleteReportDialog extends StatelessWidget {
  const DeleteReportDialog({
    Key? key,
    required this.report,
  }) : super(key: key);

  final Report report;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 10),
          const Text(
            'Wait, are you sure about that ?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: redColor,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: <Widget>[
                const Text(
                  deleteAccountDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 1.8, fontSize: 16),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'No, Take me back',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: redColor),
                    onPressed: () async {
                      // delete
                      await FirebaseFirestore.instance
                          .collection('reports')
                          .doc(report.id)
                          .delete();

                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Report deleted successfully'),
                        ),
                      );
                    },
                    child: const Text(
                      'Yes, proceed to delete',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
