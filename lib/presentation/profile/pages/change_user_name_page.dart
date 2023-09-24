import 'package:flutter/material.dart';
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
        title: 'Change username',
        trailingWidget: appbarIcon,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            TextFormField(
              decoration: inputDecoration.copyWith(
                hintText: currentUserName,
              ),
              validator: (String? value) {
                username = value;
                return validateString(value);
              },
              onSaved: (String? newValue) {
                variables['current_name'] = newValue.toString().trim();
              },
            ),
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
                variables['new_name'] = newValue.toString().trim();
              },
            ),
          ],
        ),
      ),
    );
  }
}
