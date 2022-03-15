library forgot_password;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// binding
part '../../bindings/forgot_password_binding.dart';

// controller
part '../../controllers/forgot_password_controller.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("forgot password"),
      ),
    );
  }
}
