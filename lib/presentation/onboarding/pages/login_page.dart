import 'package:flutter/material.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/presentation/core/routes.dart';
import 'package:garbage_control/presentation/core/widgets/custom_divider.dart';
import 'package:garbage_control/presentation/core/widgets/secondary_custom_app_bar.dart';
import 'package:garbage_control/presentation/onboarding/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryCustomAppBar(title: loginToYourAcc),
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
                    const LoginForm(),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(forgotPasswordPageRoute);
                        },
                        child: const Text(
                          forgotYourPassword,
                          style: TextStyle(color: primaryColor, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const CustomDivider(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(dontHaveAccount),
                        // register button
                        TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushNamed(createAccountPageRoute),
                          child: const Text(
                            register,
                            style: TextStyle(color: accentColor),
                          ),
                        )
                      ],
                    )
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
