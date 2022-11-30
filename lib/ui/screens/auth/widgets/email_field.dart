import 'package:flutter/material.dart';
import 'package:interview_task/ui/screens/auth/auth_viewmodel.dart';
import 'package:interview_task/ui/utils/common_validations.dart';
import 'package:interview_task/ui/utils/widgets/common_text_field.dart';
import 'package:provider/provider.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? email;
    email = context.select<AuthViewModel, String?>((value) {
      return value.emailController.text;
    });
    return CommonField(
      controller: context.read<AuthViewModel>().emailController,
      labelText: "Email",
      textInputAction: TextInputAction.next,
      hintText: "testing@gmail.com",
      validator: (value) => CommonValidations.isValidEmail(email),
    );
  }
}
