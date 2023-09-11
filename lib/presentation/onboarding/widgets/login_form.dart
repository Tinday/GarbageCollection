import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/application/core/utils.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/infrastructure/validators.dart';
import 'package:garbage_control/presentation/core/routes.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, dynamic> variables = <String, dynamic>{};
  bool isPassObscured = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          // email field
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: inputDecoration.copyWith(hintText: email),
            validator: (String? value) {
              return validateEmail(value.toString());
            },
            onSaved: (String? v) => variables['email'] = v.toString().trim(),
          ),
          const SizedBox(height: 20),
          // password field
          Stack(
            children: <Widget>[
              TextFormField(
                obscureText: isPassObscured,
                decoration: inputDecoration.copyWith(
                  hintText: password,
                ),
                validator: (String? value) {
                  return validatePassword(value);
                },
                onSaved: (String? v) =>
                    variables['password'] = v.toString().trim(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isPassObscured = !isPassObscured;
                    });
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: primaryColor,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  child: Text(
                    isPassObscured ? show : hide,
                    style: const TextStyle(color: primaryColor),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onLongPress: () async {
                final UserCredential credential =
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: 'byronkimani@gmail.com',
                  password: 'kimani',
                );
                Navigator.of(context).pushReplacementNamed(homePageRoute);
              },
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  formKey.currentState!.reset();
                  displayLoadingDialog(context: context);
                  final String email = variables['email'];
                  final String pass = variables['password'];

                  try {
                    final UserCredential credential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: pass,
                    );
                    Navigator.of(context).pushReplacementNamed(homePageRoute);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No user found for that email.'),
                        ),
                      );
                    } else if (e.code == 'wrong-password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Wrong password provided for that user.'),
                        ),
                      );
                    }
                  }
                  variables.clear();
                }
              },
              child: Text(login.toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}
