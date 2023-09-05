import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WasteReportingScreen extends StatefulWidget {
  @override
  _WasteReportingScreenState createState() => _WasteReportingScreenState();
}

class _WasteReportingScreenState extends State<WasteReportingScreen> {
  TextEditingController _locationController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  // Add any other necessary text controllers for form fields

  Future<dynamic> submitReport() async {
    // Get the input values from the text controllers
    String location = _locationController.text;
    String description = _descriptionController.text;
    // Add any other necessary input values from the form

    // Perform any validation on the input values

    // Send a POST request to store the report details in the database
    var response = await http.post(
      Uri.parse('https://example.com/submit_report.php'), // Replace with your API endpoint
      body: {
        'location': location,
        'description': description,
        // Add any other necessary fields
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // Handle the response data as needed
    } else {
      // Handle the error case
    }

    // Clear the text controllers and reset the form
    _locationController.clear();
    _descriptionController.clear();
    // Clear any other form fields

    // Navigate to a success or confirmation screen
    // Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Waste Reporting'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            // Add any other necessary form fields
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: submitReport,
              child: Text('Submit Report'),
            ),
          ],
        ),
      ),
    );
  }
}
