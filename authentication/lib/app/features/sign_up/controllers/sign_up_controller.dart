part of sign_up;

class SignUpController extends GetxController with ValidatorMixin {
  final email = TextEditingController();
  final password = TextEditingController();

  void signUp() {
    String? emailError = isValidEmail(email.text);
    String? passwordError = isValidPassword(password.text);

    if (emailError != null) {
      AppSnackbar.showMessage(emailError);
    } else if (passwordError != null) {
      AppSnackbar.showMessage(passwordError);
    } else {
      // continue sign up
    }
  }

  void goToForgotPassword() {}
}
