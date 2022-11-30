import 'package:flutter/material.dart';
import 'package:interview_task/ui/screens/auth/auth_viewmodel.dart';
import 'package:interview_task/ui/utils/common_validations.dart';
import 'package:interview_task/ui/utils/widgets/common_text_field.dart';
import 'package:provider/provider.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? password;
    password = context.select<AuthViewModel, String?>((value) {
      return value.passwordController.text;
    });
    return CommonField(
      controller: context.read<AuthViewModel>().passwordController,
      labelText: "Password",
      hintText: "logged",
      textInputAction: TextInputAction.next,
      validator: (value) => CommonValidations.isValidPassword(password),
    );
  }
}
