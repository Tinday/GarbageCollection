import 'package:flutter/material.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';
import 'package:garbage_control/presentation/core/widgets/custom_bottom_app_bar.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Report Dumping'),
      body: Column(children: <Widget>[Text('coming soon')]),
      bottomNavigationBar: const CustomBottomAppbar(),
    );
  }
}
