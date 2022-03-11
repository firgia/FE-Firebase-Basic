library login;

import 'package:authentication/app/constans/app_constants.dart';
import 'package:authentication/app/shared_components/async_button.dart';
import 'package:authentication/app/shared_components/header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// binding
part '../../bindings/login_binding.dart';

// controller
part '../../controllers/login_controller.dart';

// component
part '../components/button/forgot_password_button.dart';
part '../components/button/google_button.dart';
part '../components/button/login_button.dart';
part '../components/button/phone_button.dart';
part '../components/button/sign_up_button.dart';
part '../components/text/continue_text.dart';
part '../components/text_field/email_text_field.dart';
part '../components/text_field/password_text_field.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultSpacing * 2),
          child: Form(
            key: controller.form,
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
                _buildLoginButton(),
                const Spacer(flex: 2),
                const _ContinueText(),
                const SizedBox(height: kDefaultSpacing),
                _buildOtherAuthProvider(),
                const Spacer(flex: 2),
                _SignUpButton(onPressed: () {}),
                const SizedBox(height: kDefaultSpacing),
              ],
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
      child: HeaderText("Login"),
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

  Widget _buildLoginButton() {
    return _LoginButton(
      isLoading: false,
      onPressed: () => controller.login(),
    );
  }

  Widget _buildOtherAuthProvider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _GoogleButton(
          onPressed: () => controller.loginWithGoogle(),
        ),
        _PhoneButton(
          onPressed: () => controller.loginWithPhoneNumber(),
        ),
      ],
    );
  }
}
