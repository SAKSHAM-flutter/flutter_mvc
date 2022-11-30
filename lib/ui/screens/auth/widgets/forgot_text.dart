import 'package:flutter/material.dart';
import 'package:interview_task/ui/themes/colors.dart';
import 'package:interview_task/ui/themes/typography.dart';

class ForgotText extends StatelessWidget {
  const ForgotText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Forgot Password?",
          style: Poppins.medium(AppColors.labelColor.withOpacity(0.4)).s14,
        )
      ],
    );
  }
}
