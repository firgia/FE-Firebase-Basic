import 'package:authentication/app/features/sign_in/views/screens/sign_in_screen.dart';
import 'package:authentication/app/features/sign_up/views/screens/sign_up_screen.dart';
import 'package:authentication/app/features/splash/views/screens/splash_screen.dart';

import '../../features/dashboard/views/screens/dashboard_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.signIn,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.signUp,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
