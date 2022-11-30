mixin CommonValidations {
  static const int passwordMinLength = 6;

  static String? isValidPassword(String? password) {
    RegExp rex = RegExp(r"^[a-z]{6}$");
    if (password == null || password.isEmpty) {
      return 'Password Should Be Required.';
    } else if (password.length < passwordMinLength && !rex.hasMatch(password)) {
      return "Password Should Max 6 Character Long.";
    } else {
      return null;
    }
  }

  static String? isValidEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email Should Be Required.';
    }
    final isValid = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(email.trim());

    if (isValid) {
      return null;
    } else {
      return 'Please Enter Valid Email.';
    }
  }
}
