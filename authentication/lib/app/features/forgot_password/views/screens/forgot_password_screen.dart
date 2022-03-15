library forgot_password;

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
part '../../bindings/forgot_password_binding.dart';

// controller
part '../../controllers/forgot_password_controller.dart';

// component
part '../components/button/submit_button.dart';
part '../components/text_field/email_text_field.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
                      const Spacer(),
                      _buildIllustration(),
                      const SizedBox(height: kDefaultSpacing),
                      _buildTitle(),
                      const SizedBox(height: kDefaultSpacing * 1.5),
                      _buildInfo(),
                      const Spacer(),
                      _EmailTextField(controller: controller.email),
                      const Spacer(),
                      _buildSubmitButton(),
                      const Spacer(),
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
      ImageRasterPath.lock,
      height: 200,
    );
  }

  Widget _buildTitle() {
    return const Align(
      alignment: Alignment.topLeft,
      child: HeaderText("Forgot\nPassword ?"),
    );
  }

  Widget _buildInfo() {
    return Text(
      "Don't worry! Please enter the email address associated with your account.",
      style: TextStyle(
        fontSize: 15,
        color: Colors.grey[700],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Obx(
      () => _SubmitButton(
        isLoading: controller.isLoading.value,
        onPressed: () => controller.submit(),
      ),
    );
  }
}
