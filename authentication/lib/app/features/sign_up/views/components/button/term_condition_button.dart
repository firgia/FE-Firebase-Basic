part of sign_up;

class _TermConditionButton extends StatelessWidget {
  const _TermConditionButton({
    required this.onPressedTerms,
    required this.onPressedPrivacyPolice,
    Key? key,
  }) : super(key: key);

  final Function()? onPressedTerms;
  final Function()? onPressedPrivacyPolice;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "By signing up, you're agree to our ",
        style: Theme.of(context).textTheme.caption?.copyWith(height: 1.5),
        children: [
          TextSpan(
            text: " Terms and Conditions",
            style: TextStyle(color: Theme.of(context).primaryColor),
            recognizer: TapGestureRecognizer()..onTap = onPressedTerms,
          ),
          const TextSpan(text: " and "),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyle(color: Theme.of(context).primaryColor),
            recognizer: TapGestureRecognizer()..onTap = onPressedPrivacyPolice,
          )
        ],
      ),
    );
  }
}
