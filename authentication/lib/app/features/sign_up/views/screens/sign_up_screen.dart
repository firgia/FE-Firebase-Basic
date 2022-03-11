library sign_up;

import 'package:authentication/app/constans/app_constants.dart';
import 'package:authentication/app/shared_components/async_button.dart';
import 'package:authentication/app/shared_components/header_text.dart';
import 'package:authentication/app/utils/mixins/app_mixins.dart';
import 'package:authentication/app/utils/ui/ui_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// binding
part '../../bindings/sign_up_binding.dart';

// controller
part '../../controllers/sign_up_controller.dart';

// component
part '../components/button/continue_button.dart';
part '../components/button/login_button.dart';
part '../components/button/term_condition_button.dart';
part '../components/text_field/email_text_field.dart';
part '../components/text_field/password_text_field.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: Get.height,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultSpacing * 2),
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
                      const SizedBox(height: kDefaultSpacing * 2),
                      _TermConditionButton(
                        onPressedPrivacyPolice: () {},
                        onPressedTerms: () {},
                      ),
                      const Spacer(flex: 1),
                      _buildContinueButton(),
                      const SizedBox(height: kDefaultSpacing),
                      _LoginButton(onPressed: () => controller.goToLogin()),
                      const SizedBox(height: kDefaultSpacing),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(kDefaultSpacing / 2),
              child: BackButton(),
            ),
          ),
        ],
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
      child: HeaderText("Sign Up"),
    );
  }

  Widget _buildContinueButton() {
    return _ContinueButton(
      isLoading: false,
      onPressed: () => controller.signUp(),
    );
  }
}
