import 'package:flutter/material.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Home page'),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
