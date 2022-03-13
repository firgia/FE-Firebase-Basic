part of sign_in;

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({required this.onPressed, Key? key}) : super(key: key);

  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 14),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text("Sign Up"),
        )
      ],
    );
  }
}
