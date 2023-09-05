import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:garbage_control/screens/add_garbage_item_screen.dart';
import 'package:garbage_control/screens/view_garbage_items_screen.dart';
import 'package:garbage_control/screens/generate_report_screen.dart';

class WasteTrackingScreen extends StatefulWidget {
  @override
  _WasteTrackingScreenState createState() => _WasteTrackingScreenState();
}

class _WasteTrackingScreenState extends State<WasteTrackingScreen> {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  List<WasteIssue> _wasteIssues = [];

  @override
  void initState() {
    super.initState();
    _retrieveWasteIssues();
  }

  void _retrieveWasteIssues() {
    _databaseReference.child('waste_issues').once().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        setState(() {
          _wasteIssues.clear();
          Map<dynamic, dynamic> values = snapshot.value;
          values.forEach((key, value) {
            WasteIssue wasteIssue = WasteIssue(
              key,
              value['status'],
              value['assignedPersonnel'],
              value['resolutionDetails'],
            );
            _wasteIssues.add(wasteIssue);
          });
        });
      }
    });
  }

  void _updateIssueStatus(String key, String newStatus) {
    _databaseReference.child('waste_issues').child(key).update({
      'status': newStatus,
    }).then((_) {
      setState(() {
        int index = _wasteIssues.indexWhere((issue) => issue.key == key);
        if (index != -1) {
          _wasteIssues[index].status = newStatus;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Waste Tracking'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Navigate back to the dashboard (HomePage)
              Get.off(HomePage());
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _wasteIssues.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Issue ID: ${_wasteIssues[index].key}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Status: ${_wasteIssues[index].status}'),
                Text('Assigned Personnel: ${_wasteIssues[index].assignedPersonnel}'),
                Text('Resolution Details: ${_wasteIssues[index].resolutionDetails}'),
              ],
            ),
            trailing: DropdownButton<String>(
              value: _wasteIssues[index].status,
              items: <String>['Open', 'In Progress', 'Resolved'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  _updateIssueStatus(_wasteIssues[index].key, newValue);
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class WasteIssue {
  late String key;
  late String status;
  late String assignedPersonnel;
  late String resolutionDetails;

  WasteIssue(this.key, this.status, this.assignedPersonnel, this.resolutionDetails);
}
