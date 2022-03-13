part of splash;

class SplashController extends GetxController {
  final auth = AuthService();
  final isLoading = true.obs;

  @override
  void onReady() {
    super.onReady();

    validateUser();
  }

  void validateUser() async {
    isLoading.value = false;

    if (auth.isLogin) {
      await auth.reload();

      if (auth.isEmailVerified == true) {
        Get.offNamed(Routes.dashboard);
      } else {
        Get.offNamed(Routes.emailVerification);
      }
    } else {
      Get.offNamed(Routes.signIn);
    }
  }
}
