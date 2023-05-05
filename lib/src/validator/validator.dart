import 'package:task/src/helper/helper.dart';

passwordValidator(String password) {
  if (password.isEmpty) {
    return 'Please Enter Your Password';
  }
  if (password.isNotEmpty && password.length < 8) {
    return 'Please Enter Atleast 8 characters';
  }
}

emailValidator(String email) {
  if (email.isEmpty) {
    return 'Please Enter Your Email Address';
  }
  if (email.isNotEmpty) {
    RegExp regex = RegExp(emailRegex);
    bool emailValidate = regex.hasMatch(email);
    if (emailValidate) {
      return;
    } else {
      return 'Please Enter Valid Email Address';
    }
  }
}

stringValidator(String string) {
  if (string.isEmpty || string.trim().isEmpty) {
    return 'Please Enter Valid Field';
  }
}
