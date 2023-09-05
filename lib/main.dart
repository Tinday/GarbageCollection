import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
      },
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/registration', page: () => RegistrationScreen()),
      ],

      builder: (context, child) {
        return Scaffold(
         // appBar: AppBar(
         //    title: Image.asset(
         //      'assets/logo.png.webp',
         //      height: kToolbarHeight * 0.7,
         //    ),
         //  ),
          body: child,
        );
      },
    );
  }
}