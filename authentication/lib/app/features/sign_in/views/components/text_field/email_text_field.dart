part of login;

class _EmailTextField extends StatelessWidget {
  const _EmailTextField({required this.controller, Key? key}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        icon: Icon(Icons.alternate_email),
        hintText: "Email",
      ),
    );
  }
}
