part of sign_in;

class _PhoneButton extends StatelessWidget {
  const _PhoneButton({required this.onPressed, Key? key}) : super(key: key);

  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.grey[200],
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.phone,
          color: Colors.grey[800],
        ),
        tooltip: "Phone",
      ),
    );
  }
}
