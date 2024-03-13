extension OnInt on int? {
  String string() {
    if (this == null) {
      return "";
    }
    return "$this";
  }
}
