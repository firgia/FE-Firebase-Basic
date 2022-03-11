part of ui_utils;

/// contains all snackbar templates
class AppSnackbar {
  static void showMessage(String msg) {
    final context = Get.context;
    if (context == null) return;

    final snackBar = SnackBar(
      content: Text(msg),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
