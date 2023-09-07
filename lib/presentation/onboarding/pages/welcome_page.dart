import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garbage_control/constants/assets_strings.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/presentation/core/routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(welcomePageImageUrl),
            ),
            const Center(
              child: Text(
                'Garbage Collector Tracking Application',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Your friendly neighborhood collection management application',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, bottomPadding),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(loginPageRoute),
                      child: Text(login.toUpperCase()),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: inactiveGreyColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(createAccountPageRoute);
                      },
                      child: Text(
                        createAnAccount.toUpperCase(),
                        style: const TextStyle(color: primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
