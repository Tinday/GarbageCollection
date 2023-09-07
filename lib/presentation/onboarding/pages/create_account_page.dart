import 'package:flutter/material.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/presentation/core/routes.dart';
import 'package:garbage_control/presentation/core/widgets/custom_divider.dart';
import 'package:garbage_control/presentation/core/widgets/secondary_custom_app_bar.dart';
import 'package:garbage_control/presentation/onboarding/widgets/registration_form.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryCustomAppBar(title: createAnAccount),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  children: <Widget>[
                    const RegistrationForm(),
                    const SizedBox(height: 30),
                    const CustomDivider(),
                    const SizedBox(height: 20),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(alreadyHaveAcc),
                        // login button
                        TextButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed(loginPageRoute),
                          child: const Text(
                            login,
                            style: TextStyle(color: accentColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
