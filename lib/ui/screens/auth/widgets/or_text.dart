import 'package:flutter/material.dart';
import 'package:interview_task/ui/themes/colors.dart';
import 'package:interview_task/ui/themes/typography.dart';

class OrText extends StatelessWidget {
  const OrText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        divider(),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: AppColors.labelColor.withOpacity(0.6), width: 1.5),
          ),
          child: Text(
            "OR",
            style: Poppins.medium(AppColors.labelColor).s12,
          ),
        ),
        divider(),
      ],
    );
  }

  Widget divider() {
    return const Expanded(
      child: Divider(
        thickness: 1,
        color: AppColors.labelColor,
      ),
    );
  }
}
