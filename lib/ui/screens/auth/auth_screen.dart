import 'package:flutter/material.dart';
import 'package:interview_task/data/local/shared_pref_helper.dart';
import 'package:interview_task/ui/screens/auth/auth_viewmodel.dart';
import 'package:interview_task/ui/screens/auth/widgets/email_field.dart';
import 'package:interview_task/ui/screens/auth/widgets/forgot_text.dart';
import 'package:interview_task/ui/screens/auth/widgets/icons_row.dart';
import 'package:interview_task/ui/screens/auth/widgets/login_button.dart';
import 'package:interview_task/ui/screens/auth/widgets/or_text.dart';
import 'package:interview_task/ui/screens/auth/widgets/password_field.dart';
import 'package:interview_task/ui/screens/auth/widgets/remeber_check.dart';
import 'package:interview_task/ui/screens/auth/widgets/sign_up_text.dart';
import 'package:interview_task/ui/screens/home/home_screen.dart';
import 'package:interview_task/ui/themes/colors.dart';
import 'package:interview_task/ui/themes/typography.dart';
import 'package:interview_task/ui/utils/base_class/base_screen.dart';
import 'package:interview_task/ui/utils/base_class/view_model.dart';
import 'package:interview_task/ui/utils/toasts.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  static const String route = "authScreen";

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    withViewModel<AuthViewModel>(context, (viewModel) {
      if (Prefs.remember.get()) {
        viewModel.setRemember();
      }
      viewModel.onLoginSuccess = () {
        successToast("Login Success!!");
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.route, (route) => false);
      };
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AuthViewModel>();
    return ScreenBase<AuthViewModel>(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Form(
              key: provider.formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOGIN",
                    style: Poppins.semiBold(AppColors.labelColor).s20,
                  ),
                  const SizedBox(height: 20),
                  const EmailField(),
                  const PasswordField(),
                  const RememberCheck(),
                  const SizedBox(height: 15),
                  const LoginButton(),
                  const SizedBox(height: 5),
                  const ForgotText(),
                  const SizedBox(height: 10),
                  const OrText(),
                  const SizedBox(height: 30),
                  const IconsView(),
                  const SignUpText()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
