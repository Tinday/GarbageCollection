import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/infrastructure/validators.dart';
import 'package:garbage_control/presentation/core/routes.dart';
import 'package:garbage_control/presentation/core/widgets/secondary_custom_app_bar.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final Map<String, dynamic> variables = <String, dynamic>{};
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryCustomAppBar(title: forgotPassword),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30),
                const Text(
                  forgotPasswordDescription,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                // email field
                Form(
                  key: formKey,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: inputDecoration.copyWith(hintText: email),
                    validator: (String? value) {
                      return validateEmail(value.toString());
                    },
                    onSaved: (String? v) =>
                        variables['email'] = v.toString().trim(),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: variables['email']);
                        Navigator.of(context)
                            .pushNamed(resetEmailSentPageRoute);
                      }
                    },
                    child: Text(forgotPassword.toUpperCase()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
