part of login;

class LoginController extends GetxController {
  final form = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  void login() {}
  void loginWithGoogle() {}
  void loginWithPhoneNumber() {}

  void goToForgotPassword() {}
}
