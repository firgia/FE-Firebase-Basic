library dashboard;

import 'package:authentication/app/config/routes/app_pages.dart';
import 'package:authentication/app/shared_components/async_button.dart';
import 'package:authentication/app/utils/services/service.dart';

import '../../../../shared_components/header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// binding
part '../../bindings/dashboard_binding.dart';

// controller
part '../../controllers/dashboard_controller.dart';

// component
part '../components/sign_out_button.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HeaderText("dashboard"),
            const SizedBox(height: 10),
            _buildSignOutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSignOutButton() {
    return Obx(
      () => _SignOutButton(
        isLoading: controller.isLoading.value,
        onPressed: () => controller.signOut(),
      ),
    );
  }
}
