import 'package:flutter/material.dart';
import 'package:interview_task/ui/screens/auth/auth_viewmodel.dart';
import 'package:interview_task/ui/themes/colors.dart';
import 'package:interview_task/ui/themes/typography.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {
        context.read<AuthViewModel>().onLogin();
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(size.width, 45),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.pinkColor),
      ),
      child: Text(
        "LOGIN",
        style: Poppins.regular(Colors.white).s18,
      ),
    );
  }
}
