import 'package:async_redux/async_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/application/redux/view_models/user_state_view_model.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/infrastructure/validators.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';

class ChangeUserNamePage extends StatefulWidget {
  const ChangeUserNamePage({Key? key}) : super(key: key);

  @override
  State<ChangeUserNamePage> createState() => _ChangeUserNamePageState();
}

class _ChangeUserNamePageState extends State<ChangeUserNamePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, dynamic> variables = <String, dynamic>{};
  String? username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Change username'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  const Text('Please enter your preferred username below'),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: inputDecoration.copyWith(
                      hintText: newUserName,
                    ),
                    validator: (String? value) {
                      username = value;
                      return validateString(value);
                    },
                    onSaved: (String? newValue) {
                      variables['full_name'] = newValue.toString().trim();
                    },
                  ),
                ],
              ),
            ),
            StoreConnector<AppState, UserStateViewModel>(
              builder: (BuildContext context, UserStateViewModel vm) {
                final String? documentId = vm.documentId;
                return SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        formKey.currentState!.reset();

                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(documentId)
                            .update({'full_name': variables['full_name']});
                      }
                    },
                    child: const Text('Update'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
