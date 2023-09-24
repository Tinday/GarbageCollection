import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/application/core/utils.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/infrastructure/validators.dart';
import 'package:garbage_control/presentation/core/routes.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, dynamic> variables = <String, dynamic>{};
  bool isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          // full name field
          TextFormField(
            decoration: inputDecoration.copyWith(hintText: fullName),
            validator: (String? value) {
              return validateName(value.toString());
            },
            onSaved: (String? v) => variables['fullName'] = v.toString().trim(),
          ),
          const SizedBox(height: 20),
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
          // phone number
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: inputDecoration.copyWith(hintText: phoneNumber),
            validator: (String? value) {
              return validateString(value.toString());
            },
            maxLength: 10,
            onSaved: (String? v) =>
                variables['phone_number'] = v.toString().trim(),
          ),
          const SizedBox(height: 20),
          // password field
          Stack(
            children: <Widget>[
              TextFormField(
                obscureText: isPasswordObscured,
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
                      isPasswordObscured = !isPasswordObscured;
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
                    isPasswordObscured ? show : hide,
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
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  displayLoadingDialog(context: context);
                  final String email = variables['email'];
                  final String pass = variables['password'];

                  try {
                    final UserCredential credential = await FirebaseAuth
                        .instance
                        .createUserWithEmailAndPassword(
                      email: email,
                      password: pass,
                    );
                    Navigator.of(context).pushReplacementNamed(homePageRoute);
                    CollectionReference users =
                        FirebaseFirestore.instance.collection('users');
                    users.add({
                      'full_name': variables['fullName'],
                      'email': variables['email'],
                      'phone_number': variables['phone_number']
                    });
                    Navigator.of(context).pushReplacementNamed(homePageRoute);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('The password provided is too weak.'),
                        ),
                      );
                    } else if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'The account already exists for that email.',
                          ),
                        ),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'An error occurred creating the account. Please try again later.',
                        ),
                      ),
                    );
                  }

                  variables.clear();
                }
              },
              child: Text(createAccount.toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}
