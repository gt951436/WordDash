import 'package:client/screens/create_room_screen.dart';
import 'package:client/screens/home_screen.dart';
import 'package:client/screens/join_room_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Word Dash',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        // object for routes
        routes: {
          '/': (context) => const HomeScreen(),
          '/create-room': (context) => const CreateRoomScreen(),
          '/join-room': (context) => const JoinRoomScreen(),
        });
  }
}
