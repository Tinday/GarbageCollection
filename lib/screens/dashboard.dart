import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garbage_control/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:garbage_control/screens/waste_tracking_screen.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garbage Control Dashboard'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'exit') {
                // Quit the program

                Get.off(LoginScreen());
              } else if (value == 'homepage') {
                // Navigate to the homepage
                // You can add your own implementation here66+36+6++6+33+36+6+++3+363+63+++++636+3+633+33
              } else if (value == 'services') {
                // Navigate to the "Our Services" page
                // You can add your own implementation here
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'homepage',
                  child: Text('Homepage'),
                ),
                PopupMenuItem<String>(
                  value: 'services',
                  child: Text('Our Services'),
                ),
                PopupMenuItem<String>(
                  value: 'exit',
                  child: Text('Exit'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCard(
              context,
              Icons.add_circle,
              'Add Garbage Item',
              Colors.green,
                  () => _navigateToAddGarbageItem(context),
            ),
            _buildCard(
              context,
              Icons.search,
              'View Garbage Items',
              Colors.blue,
                  () => _navigateToViewGarbageItems(context),
            ),
            _buildCard(
              context,
              Icons.report,
              'Generate Report',
              Colors.orange,
                  () => _navigateToGenerateReport(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context,
      IconData icon,
      String title,
      Color color,
      VoidCallback onTap,
      ) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: color,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 48.0,
              ),
              SizedBox(height: 16.0),
              Text(
                title,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToAddGarbageItem(BuildContext context) {
    // Navigate to add garbage item screen
  }

  void _navigateToViewGarbageItems(BuildContext context) {
    // Navigate to view garbage items screen
  }

  void _navigateToGenerateReport(BuildContext context) {
    // Navigate to generate report screen
  }
}
