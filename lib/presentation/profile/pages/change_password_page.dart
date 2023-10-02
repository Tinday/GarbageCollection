import 'package:flutter/material.dart';
import 'package:garbage_control/application/core/utils.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/infrastructure/validators.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, dynamic> variables = <String, dynamic>{};
  bool isCurrentPassObscured = true;
  bool isNewPassObscured = true;
  bool isNewConfirmPassObscured = true;
  String? newPass;
  String? oldPass;

  @override
  Widget build(BuildContext context) {
    final Widget appbarIcon = TextButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          formKey.currentState!.reset();
          changeUserPassword(
            context: context,
            password: variables['current_password'],
          );
        }
      },
      child: const Text(
        update,
        style: TextStyle(color: whiteColor, fontSize: 16),
      ),
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: changePassword,
        trailingWidget: appbarIcon,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  // current password
                  Stack(
                    children: <Widget>[
                      TextFormField(
                        obscureText: isCurrentPassObscured,
                        decoration: inputDecoration.copyWith(
                          hintText: currentPassword,
                        ),
                        validator: (String? value) {
                          oldPass = value;
                          return validateString(value);
                        },
                        onSaved: (String? newValue) {
                          variables['current_password'] =
                              newValue.toString().trim();
                        },
                      ),
                      ShowPassButton(
                        isObscured: isCurrentPassObscured,
                        onTapped: () => setState(() {
                          isCurrentPassObscured = !isCurrentPassObscured;
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // new password
                  Stack(
                    children: <Widget>[
                      TextFormField(
                        obscureText: isNewPassObscured,
                        decoration: inputDecoration.copyWith(
                          hintText: newPassword,
                        ),
                        validator: (String? value) {
                          newPass = value;
                          return validateNewPassword(
                            newPassword: value,
                            oldPassword: oldPass,
                          );
                        },
                        onSaved: (String? newValue) {
                          variables['new_password'] =
                              newValue.toString().trim();
                        },
                      ),
                      ShowPassButton(
                        isObscured: isNewPassObscured,
                        onTapped: () => setState(() {
                          isNewPassObscured = !isNewPassObscured;
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: <Widget>[
                      TextFormField(
                        obscureText: isNewConfirmPassObscured,
                        decoration: inputDecoration.copyWith(
                          hintText: confirmNewPassword,
                        ),
                        validator: (String? value) =>
                            validateConfirmPassword(value.toString(), newPass),
                      ),
                      ShowPassButton(
                        isObscured: isNewConfirmPassObscured,
                        onTapped: () => setState(() {
                          isNewConfirmPassObscured = !isNewConfirmPassObscured;
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              )),
        ),
      ),
      // bottomNavigationBar: const CustomBottomAppbar(isAdmin: false),
    );
  }
}

class ShowPassButton extends StatelessWidget {
  const ShowPassButton({
    Key? key,
    required this.onTapped,
    required this.isObscured,
  }) : super(key: key);
  final Function onTapped;
  final bool isObscured;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {
          onTapped.call();
        },
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        child: Text(
          isObscured ? show : hide,
          style: const TextStyle(color: primaryColor),
        ),
      ),
    );
  }
}
