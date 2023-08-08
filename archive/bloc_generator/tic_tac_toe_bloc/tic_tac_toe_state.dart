// PROMPT: Create a BLoC to handle a simple tic-tac-toe game. Keep track of 
// the users' inputs and display the winner once the game is over. 

// Output from: https://junior.atomsbox.com/#/bloc-generator

part of 'tic_tac_toe_bloc.dart';

enum TicTacToeStatus { 
  initial, 
  player1_turn, 
  player2_turn, 
  player1_win, 
  player2_win, 
  draw 
}

class TicTacToeState extends Equatable {
  final List<List<String>> gameBoard;
  final String currentPlayer;
  final String? winner;
  final TicTacToeStatus status;

  const TicTacToeState({
    this.gameBoard = const [
      ['', '', ''],
      ['', '', ''],
      ['', '', ''],
    ],
    this.currentPlayer = 'Player 1',
    this.winner,
    this.status = TicTacToeStatus.initial,
  });

  TicTacToeState copyWith({
    List<List<String>>? gameBoard,
    String? currentPlayer,
    String? winner,
    TicTacToeStatus? status,
  }) {
    return TicTacToeState(
      gameBoard: gameBoard ?? this.gameBoard,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      winner: winner ?? this.winner,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [gameBoard, currentPlayer, winner, status];
}