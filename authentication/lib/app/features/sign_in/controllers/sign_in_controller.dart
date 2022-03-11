part of login;

class SignInController extends GetxController with ValidatorMixin {
  final auth = AuthService();
  final email = TextEditingController();
  final password = TextEditingController();

  final isLoading = false.obs;
  void login() async {
    String? emailError = isValidEmail(email.text);
    String? passwordError = isValidPassword(password.text);

    if (emailError != null) {
      AppSnackbar.showMessage(emailError);
    } else if (passwordError != null) {
      AppSnackbar.showMessage(passwordError);
    } else {
      isLoading.value = true;

      try {
        await auth.signInWithEmail(
          email: email.text,
          password: password.text,
        );

        goToDashboard();

        isLoading.value = false;
      } on FirebaseAuthException catch (error) {
        isLoading.value = false;
        switch (error.code) {
          case 'invalid-email':
            AppSnackbar.showMessage('Your email address is not valid.');
            break;
          case 'user-disabled':
            AppSnackbar.showMessage('Your email has been disabled.');
            break;
          case 'user-not-found':
            AppSnackbar.showMessage('User not found.');
            break;
          case 'wrong-password':
            AppSnackbar.showMessage('wrong password.');
            break;
          default:
            AppSnackbar.showMessage('Something Error!');
        }
      } catch (error) {
        isLoading.value = false;

        AppSnackbar.showMessage('Something Error!');
      }
    }
  }

  void loginWithGoogle() {}
  void loginWithPhoneNumber() {}
  void goToDashboard() => Get.offAllNamed(Routes.dashboard);
  void goToSignUp() => Get.toNamed(Routes.signUp);
  void goToForgotPassword() {}
}
