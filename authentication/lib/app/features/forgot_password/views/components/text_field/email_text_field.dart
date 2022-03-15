part of forgot_password;

class _EmailTextField extends StatelessWidget {
  const _EmailTextField({required this.controller, Key? key}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        icon: Icon(Icons.alternate_email),
        hintText: "Your Email",
      ),
    );
  }
}
