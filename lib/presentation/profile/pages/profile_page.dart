import 'package:flutter/material.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';
import 'package:garbage_control/presentation/core/widgets/custom_bottom_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      body: Column(children: <Widget>[Text('coming soon')]),
      bottomNavigationBar: const CustomBottomAppbar(),
    );
  }
}
