library email_verification;

import 'package:authentication/app/constans/app_constants.dart';
import 'package:authentication/app/shared_components/async_button.dart';
import 'package:authentication/app/shared_components/header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// binding
part '../../bindings/email_verification_binding.dart';

// controller
part '../../controllers/email_verification_controller.dart';

// component
part '../components/button/sign_out_button.dart';
part '../components/button/resend_button.dart';
part '../components/text/info_text.dart';

class EmailVerificationScreen extends GetView<EmailVerificationController> {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultSpacing * 2),
          child: Column(
            children: [
              const Spacer(),
              _buildIllustration(),
              const SizedBox(height: kDefaultSpacing * 4),
              const HeaderText("Email Verification"),
              const SizedBox(height: kDefaultSpacing),
              const _InfoText(email: "test@gmail.com"),
              const Spacer(),
              _buildSignOutButton(),
              const SizedBox(height: kDefaultSpacing),
              _buildResendButton(),
              const SizedBox(height: kDefaultSpacing),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIllustration() {
    return Image.asset(
      ImageRasterPath.email,
      height: 200,
    );
  }

  Widget _buildSignOutButton() {
    return _SignOutButton(
      isLoading: false,
      onPressed: () {},
    );
  }

  Widget _buildResendButton() {
    return _ResendButton(
      onPressed: () {},
      isLoading: false,
    );
  }
}
