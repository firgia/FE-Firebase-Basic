part of sign_in;

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({required this.onPressed, Key? key})
      : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text("Forgot Password"),
    );
  }
}
