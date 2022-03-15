part of 'app_pages.dart';

/// used to switch pages
class Routes {
  static const splash = _Paths.splash;
  static const signIn = _Paths.signIn;
  static const signUp = _Paths.signUp;
  static const emailVerification = _Paths.emailVerification;
  static const forgotPassword = _Paths.forgotPassword;
  static const dashboard = _Paths.dashboard;
}

/// contains a list of route names.
// made separately to make it easier to manage route naming
class _Paths {
  static const splash = '/';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const emailVerification = '/email-verification';
  static const forgotPassword = '/forgot-password';
  static const dashboard = '/dashboard';
}
