import "package:client/utils/socket_client.dart";
import "package:client/utils/socket_methods.dart";
import "package:client/widgets/custom_button.dart";
import "package:client/widgets/custom_text_field.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void dispose() {
    // avoid memory leakage
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Create Room',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                CustomTextField(
                  controller: _nameController,
                  hintText: "Enter your nickname",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: "Create",
                  onTap: () => _socketMethods.createGame(_nameController.text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
