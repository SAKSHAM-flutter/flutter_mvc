extension OnInt on int? {
  String string() {
    if (this == null) {
      return "";
    }
    return "$this";
  }
}

extension ONString on String? {
  ///Checking value is null or empty;
  bool isNull() {
    if (this == null) {
      return true;
    } else if (this!.trim().isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  ///Checking value is null or empty;
  bool isNotNull() {
    return !isNull();
  }
}
