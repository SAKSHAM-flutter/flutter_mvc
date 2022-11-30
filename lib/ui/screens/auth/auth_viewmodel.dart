import 'package:flutter/cupertino.dart';
import 'package:interview_task/data/local/shared_pref_helper.dart';
import 'package:interview_task/ui/utils/base_class/view_model.dart';

class AuthViewModel extends ViewModel {
  VoidCallback? onLoginSuccess;
  bool _isRemember = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool get isRemember => _isRemember;

  set isRemember(value) {
    _isRemember = value;
    notifyListeners();
  }

  void setRemember() {
    emailController.text = Prefs.email.get();
    isRemember = Prefs.remember.get();
    passwordController.text = Prefs.password.get();
  }

  void onLogin() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formState.currentState!.validate()) {
      formState.currentState!.save();
      if (isRemember) {
        Prefs.email.set(emailController.text.trim());
        Prefs.password.set(passwordController.text.trim());
      }
      Prefs.remember.set(isRemember);
      bool emailMatched =
          emailController.text.trim().toLowerCase() == "testing@gmail.com";
      bool passwordMatched =
          passwordController.text.trim().toLowerCase() == "logged";
      if (emailMatched && passwordMatched) {
        onLoginSuccess?.call();
      } else {
        onError?.call("Email And Password Does Not Matched.");
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
