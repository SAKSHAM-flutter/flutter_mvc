import 'package:flutter/material.dart';
import 'package:interview_task/ui/themes/colors.dart';
import 'package:interview_task/ui/themes/typography.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Need an account?  ",
          style: Poppins.semiBold(AppColors.labelColor).s14,
          children: [
            TextSpan(
              text: "SIGN UP",
              style: Poppins.medium(AppColors.labelColor)
                  .s16
                  .copyWith(decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }
}
