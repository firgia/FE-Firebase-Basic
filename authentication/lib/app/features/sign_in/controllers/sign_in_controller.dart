part of sign_in;

class SignInController extends GetxController with ValidatorMixin {
  final auth = AuthService();
  final email = TextEditingController();
  final password = TextEditingController();

  final isLoading = false.obs;

  void signIn() async {
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
        isLoading.value = false;
        if (auth.isEmailVerified == true) {
          goToDashboard();
        } else {
          goToEmailVerification();
        }
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        switch (e.code) {
          case 'invalid-email':
            AppSnackbar.showMessage("Invalid email.");
            break;
          case 'user-disabled':
            AppSnackbar.showMessage("Your email has been disabled.");
            break;
          case 'user-not-found':
            AppSnackbar.showMessage("User not found.");
            break;
          case 'wrong-password':
            AppSnackbar.showMessage("Wrong password.");
            break;
          default:
            AppSnackbar.showMessage("Something Error!");
        }
      } catch (error) {
        isLoading.value = false;
        AppSnackbar.showMessage("Something Error!");
      }
    }
  }

  void signInWithGoogle() {}
  void signInWithPhoneNumber() {}
  void goToEmailVerification() => Get.offNamed(Routes.emailVerification);
  void goToDashboard() => Get.offNamed(Routes.dashboard);
  void goToForgotPassword() => Get.toNamed(Routes.forgotPassword);
  void goToSignUp() => Get.toNamed(Routes.signUp);
}
