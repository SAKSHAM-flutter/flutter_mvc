import 'package:flutter/material.dart';
import 'package:interview_task/ui/screens/auth/auth_viewmodel.dart';
import 'package:interview_task/ui/themes/colors.dart';
import 'package:interview_task/ui/themes/typography.dart';
import 'package:provider/provider.dart';

class RememberCheck extends StatelessWidget {
  const RememberCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<AuthViewModel, bool>(
      selector: (context, provider) => provider.isRemember,
      builder: (context, isSelected, child) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: isSelected,
            activeColor: AppColors.pinkColor,
            onChanged: (value) {
              context.read<AuthViewModel>().isRemember = value;
            },
          ),
          Text("Remember me?", style: Poppins.medium(Colors.black).s16)
        ],
      ),
    );
  }
}
