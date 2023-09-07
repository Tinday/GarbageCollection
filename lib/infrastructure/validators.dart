import 'package:garbage_control/constants/strings.dart';

String? validateEmail(String? input) {
  if (input != null && input.isNotEmpty) {
    if (RegExp(emailRegex).hasMatch(input)) {
      return null;
    } else {
      return pleaseInputValidEmail;
    }
  }
  return pleaseEnterField;
}

String? validatePassword(String? input) {
  if (input != null && input.isNotEmpty) {
    if (input.length >= 6) {
      return null;
    } else {
      return passwordTooShort;
    }
  }
  return pleaseEnterField;
}

String? validateNewPassword({String? oldPassword, String? newPassword}) {
  if (newPassword != null && newPassword.isNotEmpty) {
    if (newPassword.length >= 6) {
      if (oldPassword == newPassword) {
        return newOldPasswordMatch;
      } else {
        return null;
      }
    } else {
      return passwordTooShort;
    }
  }
  return pleaseEnterField;
}

String? validateConfirmPassword(String? input, String? firstPass) {
  if (validatePassword(input) == null) {
    if (input.toString() == firstPass.toString()) {
      return null;
    }
    return makeSurePasswordsMatch;
  }
  return passwordTooShort;
}

String? validateName(String? input) {
  if (input != null && input.isNotEmpty) {
    return null;
  } else {
    return pleaseEnterName;
  }
}

String? validateString(String? input) {
  if (input != null && input.isNotEmpty) {
    return null;
  } else {
    return pleaseEnterField;
  }
}
