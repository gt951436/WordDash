import 'package:client/models/game_state.dart';
import 'package:flutter/material.dart';

class GameStateProvider extends ChangeNotifier {
  GameState _gameState = GameState(
    id: '',
    players: [],
    isJoin: true,
    words: [],
    isOver: false,
  );

  Map<String, dynamic> get gameState => _gameState.toJson();

  void updateGameState({
    required id,
    required players,
    required isJoin,
    required words,
    required isOver,
  }) {
    _gameState = GameState(
      id: id,
      players: players,
      isJoin: isJoin,
      words: words,
      isOver: isOver,
    );
    notifyListeners();
  }
}
