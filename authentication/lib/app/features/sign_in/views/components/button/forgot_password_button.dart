part of login;

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({required this.onPressed, Key? key})
      : super(key: key);

  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text("Forgot Password ?"),
      onPressed: onPressed,
    );
  }
}
