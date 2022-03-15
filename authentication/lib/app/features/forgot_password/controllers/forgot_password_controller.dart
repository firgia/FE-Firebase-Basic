part of forgot_password;

class ForgotPasswordController extends GetxController with ValidatorMixin {
  final auth = AuthService();
  final email = TextEditingController();
  final isLoading = false.obs;

  void submit() async {
    String? emailError = isValidEmail(email.text);

    if (emailError != null) {
      AppSnackbar.showMessage(emailError);
      return;
    }

    isLoading.value = true;
    try {
      await auth.sendPasswordResetEmail(email.text);

      Get.back();
      AppSnackbar.showNotification(
        icon: const Icon(
          Icons.email,
          color: Colors.orange,
        ),
        title: "Check your email",
        message: "We already send a link to reset your password",
      );
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          AppSnackbar.showMessage('Your email address is not valid.');
          break;

        case 'user-not-found':
          AppSnackbar.showMessage('User not found.');
          break;

        default:
          AppSnackbar.showMessage("Something Error!");
      }
    } catch (err) {
      AppSnackbar.showMessage("Something Error!");
    }
    isLoading.value = false;
  }
}
