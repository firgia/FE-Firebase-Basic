part of login;

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({required this.controller, Key? key})
      : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock_outline_rounded),
        hintText: "Password",
      ),
    );
  }
}
