import 'package:flutter/material.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';

class ReportDetailPage extends StatelessWidget {
  const ReportDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Report Detail'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    'Area of dumping: ',
                    style: TextStyle(
                        fontSize: 18,
                        color: accentColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Area of dumping: ',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Area of dumping: ',
                    style: TextStyle(
                        fontSize: 18,
                        color: accentColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Area of dumping: ',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
