library email_verification;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// binding
part '../../bindings/email_verification_binding.dart';

// controller
part '../../controllers/email_verification_controller.dart';

class EmailVerificationScreen extends GetView<EmailVerificationController> {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Email"),
      ),
    );
  }
}
