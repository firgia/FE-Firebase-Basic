part of sign_up;

class SignUpController extends GetxController with ValidatorMixin {
  final auth = AuthService();
  final email = TextEditingController();
  final password = TextEditingController();

  final isLoading = false.obs;

  void signUp() async {
    String? emailError = isValidEmail(email.text);
    String? passwordError = isValidPassword(password.text);

    if (emailError != null) {
      AppSnackbar.showMessage(emailError);
    } else if (passwordError != null) {
      AppSnackbar.showMessage(passwordError);
    } else {
      isLoading.value = true;

      try {
        await auth.signUpWithEmail(
          email: email.text,
          password: password.text,
        );

        AppSnackbar.showMessage("Successfully created account");
        await auth.sendEmailVerification();
        goToEmailVerification();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'email-already-in-use':
            AppSnackbar.showMessage(
                "The account already exists for that email.");
            break;
          case 'invalid-email':
            AppSnackbar.showMessage("Invalid email.");
            break;
          case 'operation-not-allowed':
            AppSnackbar.showMessage("Operation not allowed.");
            break;
          case 'weak-password':
            AppSnackbar.showMessage("The password provided is too weak.");
            break;
          default:
            AppSnackbar.showMessage("Something Error!");
        }
      } catch (error) {
        AppSnackbar.showMessage("Something Error!");
      }

      isLoading.value = false;
    }
  }

  void goToEmailVerification() => Get.offAllNamed(Routes.emailVerification);
  void goToSignIn() => Get.back();
}
