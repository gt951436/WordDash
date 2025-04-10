import 'package:client/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 600,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Create/Join room to play!',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //buttons are children
            children: [
              CustomButton(
                text: 'Create',
                onTap: () => Navigator.pushNamed(context, '/create-room'),
                isHome: true,
              ),
              CustomButton(
                text: 'Join',
                onTap: () => Navigator.pushNamed(context, '/join-room'),
                isHome: true,
              ),
            ],
          ),
        ]),
      )),
    );
  }
}
