part of email_verification;

class EmailVerificationController extends GetxController {
  final auth = AuthService();

  final isLoadingSignOut = false.obs;
  final isLoadingResend = false.obs;

  String? email;
  Timer? timer;

  @override
  void onInit() async {
    super.onInit();

    if (auth.currentUser != null) {
      email = auth.currentUser?.email;

      checkEmailVerified();
    } else {
      email = null;
    }
  }

  void checkEmailVerified() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) async {
        await auth.reload();

        if (auth.isEmailVerified == true) {
          timer?.cancel();
          goToDashboard();
        }
      },
    );
  }

  Future<void> resend() async {
    isLoadingResend.value = true;

    try {
      await auth.sendEmailVerification();
      AppSnackbar.showMessage("Verification has been sent.");
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'too-many-requests':
          AppSnackbar.showMessage("Too many request.");
          break;
        default:
          AppSnackbar.showMessage("Something Error!");
      }
    } catch (error) {
      AppSnackbar.showMessage("Something Error!");
    }

    isLoadingResend.value = false;
  }

  void goToDashboard() => Get.offNamed(Routes.dashboard);

  void signOut() async {
    isLoadingSignOut.value = true;
    await auth.signOut();
    isLoadingSignOut.value = false;
    Get.offAllNamed(Routes.splash);
  }

  @override
  void onClose() {
    super.onClose();

    timer?.cancel();
  }
}
