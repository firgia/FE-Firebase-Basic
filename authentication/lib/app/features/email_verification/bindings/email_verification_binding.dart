part of email_verification;

class EmailVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmailVerificationController());
  }
}
