part of sign_up;

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({required this.controller, Key? key})
      : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock_outline_rounded),
        hintText: "Password",
      ),
    );
  }
}
