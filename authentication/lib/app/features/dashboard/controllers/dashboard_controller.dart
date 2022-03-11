part of dashboard;

class DashboardController extends GetxController {
  final auth = AuthService();
  final isLoading = false.obs;

  void signOut() async {
    isLoading.value = true;
    await auth.signOut();
    isLoading.value = false;
    Get.offAllNamed(Routes.splash);
  }
}
