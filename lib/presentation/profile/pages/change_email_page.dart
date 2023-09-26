import 'package:async_redux/async_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/application/redux/view_models/user_state_view_model.dart';
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
                          variables['email'] = newValue.toString().trim();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              StoreConnector<AppState, UserStateViewModel>(
                converter: (Store<AppState> store) =>
                    UserStateViewModel.fromStore(store),
                builder: (BuildContext context, UserStateViewModel vm) {
                  final String? documentId = vm.documentId;
                  return SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          formKey.currentState!.reset();
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(documentId)
                              .update({'email': variables['email']});
                        }
                      },
                      child: const Text('Update'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
