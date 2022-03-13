library sign_in;

import 'package:authentication/app/config/routes/app_pages.dart';
import 'package:authentication/app/constans/app_constants.dart';
import 'package:authentication/app/shared_components/async_button.dart';
import 'package:authentication/app/shared_components/header_text.dart';
import 'package:authentication/app/utils/mixins/app_mixins.dart';
import 'package:authentication/app/utils/services/service.dart';
import 'package:authentication/app/utils/ui/ui_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// binding
part '../../bindings/sign_in_binding.dart';

// controller
part '../../controllers/sign_in_controller.dart';

// component
part '../components/button/forgot_password_button.dart';
part '../components/button/google_button.dart';
part '../components/button/phone_button.dart';
part '../components/button/sign_in_button.dart';
part '../components/button/sign_up_button.dart';
part '../components/text/continue_text.dart';
part '../components/text_field/email_text_field.dart';
part '../components/text_field/password_text_field.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultSpacing * 2),
              child: Column(
                children: [
                  const SizedBox(height: kDefaultSpacing),
                  _buildIllustration(),
                  const SizedBox(height: kDefaultSpacing),
                  _buildTitle(),
                  const SizedBox(height: kDefaultSpacing * 1.5),
                  _EmailTextField(controller: controller.email),
                  const SizedBox(height: kDefaultSpacing),
                  _PasswordTextField(controller: controller.password),
                  _buildForgotPasswordButton(),
                  const Spacer(),
                  _buildSignInButton(),
                  const Spacer(flex: 2),
                  const _ContinueText(),
                  const SizedBox(height: kDefaultSpacing),
                  _buildOtherAuthProvider(),
                  const Spacer(flex: 2),
                  _SignUpButton(onPressed: () => controller.goToSignUp()),
                  const SizedBox(height: kDefaultSpacing),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIllustration() {
    return Image.asset(
      ImageRasterPath.relax,
      height: 200,
    );
  }

  Widget _buildTitle() {
    return const Align(
      alignment: Alignment.topLeft,
      child: HeaderText("Sign In"),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.topRight,
      child: _ForgotPasswordButton(
        onPressed: () => controller.goToForgotPassword(),
      ),
    );
  }

  Widget _buildSignInButton() {
    return Obx(
      () => _SignInButton(
        isLoading: controller.isLoading.value,
        onPressed: () => controller.signIn(),
      ),
    );
  }

  Widget _buildOtherAuthProvider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _GoogleButton(
          onPressed: () => controller.signInWithGoogle(),
        ),
        _PhoneButton(
          onPressed: () => controller.signInWithPhoneNumber(),
        ),
      ],
    );
  }
}
