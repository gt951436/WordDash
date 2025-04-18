import 'package:client/providers/game_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameStateProvider>(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: game.gameState['players'].length,
      itemBuilder: (context, index) {
        var playerData = game.gameState['players'][index];
        return ListTile(
          title: Text(
            playerData['nickname'],
          ),
          trailing: Text(
            playerData['WPM'].toString(),
          ),
        );
      },
    );
  }
}
