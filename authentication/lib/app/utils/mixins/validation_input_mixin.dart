part of app_mixins;

/// use this mixin for all form field
mixin ValidatorMixin {
  String? isValidEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required ";
    } else if (!value.isEmail) {
      return "Invalid Email";
    }
    return null;
  }

  String? isValidPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password is required";
    } else if (value.length > 10 || value.length < 5) {
      return "Password at least 5-10 character";
    } else if (value.split(" ").length > 1) {
      return "Invalid Password";
    }

    return null;
  }
}
