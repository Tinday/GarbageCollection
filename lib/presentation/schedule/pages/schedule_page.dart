import 'package:flutter/material.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';
import 'package:garbage_control/presentation/core/widgets/custom_bottom_app_bar.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Schedules'),
      body: Column(children: <Widget>[Center(child: Text('coming soon'))]),
      bottomNavigationBar: const CustomBottomAppbar(),
    );
  }
}