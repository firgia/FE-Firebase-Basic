part of sign_up;

class _SignInButton extends StatelessWidget {
  const _SignInButton({required this.onPressed, Key? key}) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have a account?",
          style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 14),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text("Sign In"),
        )
      ],
    );
  }
}
