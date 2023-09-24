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
    final Widget appbarIcon = TextButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          formKey.currentState!.reset();
        }
      },
      child: const Text(
        update,
        style: TextStyle(color: whiteColor, fontSize: 16),
      ),
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Change email',
        trailingWidget: appbarIcon,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            TextFormField(
              decoration: inputDecoration.copyWith(
                hintText: currentEmail,
              ),
              validator: (String? value) {
                username = value;
                return validateString(value);
              },
              onSaved: (String? newValue) {
                variables['current_password'] = newValue.toString().trim();
              },
            ),
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
                variables['current_password'] = newValue.toString().trim();
              },
            ),
          ],
        ),
      ),
    );
  }
}
