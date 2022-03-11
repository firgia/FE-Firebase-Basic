part of splash;

class SplashController extends GetxController {
  final auth = AuthService();
  final isLoading = true.obs;

  @override
  void onReady() {
    super.onReady();

    isLoading.value = false;
    if (auth.isLogin()) {
      Get.offNamed(Routes.dashboard);
    } else {
      Get.offNamed(Routes.signIn);
    }
  }
}
