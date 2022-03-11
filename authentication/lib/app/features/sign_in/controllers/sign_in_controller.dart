part of login;

class SignInController extends GetxController with ValidatorMixin {
  final email = TextEditingController();
  final password = TextEditingController();

  void login() {
    String? emailError = isValidEmail(email.text);
    String? passwordError = isValidPassword(password.text);

    if (emailError != null) {
      AppSnackbar.showMessage(emailError);
    } else if (passwordError != null) {
      AppSnackbar.showMessage(passwordError);
    } else {
      // continue login
    }
  }

  void loginWithGoogle() {}
  void loginWithPhoneNumber() {}
  void goToSignUp() => Get.toNamed(Routes.signUp);
  void goToForgotPassword() {}
}
