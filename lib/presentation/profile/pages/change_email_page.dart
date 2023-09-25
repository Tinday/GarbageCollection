import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/infrastructure/validators.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({Key? key}) : super(key: key);

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, dynamic> variables = <String, dynamic>{};
  String? username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Change email'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text('Please enter your new email address below'),
                      const SizedBox(height: 30),
                      TextFormField(
                        decoration: inputDecoration.copyWith(
                          hintText: newEmail,
                        ),
                        validator: (String? value) {
                          username = value;
                          return validateString(value);
                        },
                        onSaved: (String? newValue) {
                          variables['current_password'] =
                              newValue.toString().trim();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      formKey.currentState!.reset();
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc('ABC123')
                          .update({'company': 'Stokes and Sons'})
                          .then((value) => print("User Updated"))
                          .catchError(
                            (error) => print("Failed to update user: $error"),
                          );
                    }
                  },
                  child: const Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
