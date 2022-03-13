part of email_verification;

class _ResendButton extends StatelessWidget {
  const _ResendButton(
      {required this.onPressed, required this.isLoading, Key? key})
      : super(key: key);

  final Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't receive link verification?",
          style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 14),
        ),
        if (isLoading) const SizedBox(width: kDefaultSpacing / 2),
        TextButton(
          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? const SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(),
                )
              : const Text("Resend"),
        ),
      ],
    );
  }
}
