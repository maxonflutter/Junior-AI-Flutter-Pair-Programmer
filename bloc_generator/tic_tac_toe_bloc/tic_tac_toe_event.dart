// PROMPT: Create a BLoC to handle a simple tic-tac-toe game. Keep track of 
// the users' inputs and display the winner once the game is over. 

// Output from: https://junior.atomsbox.com/#/bloc-generator

// Note the TicTacToePlayerMoveEvent does not have the required parameters that are used in the BLoC
// row and column. 

part of 'tic_tac_toe_bloc.dart';

abstract class TicTacToeEvent extends Equatable {
  const TicTacToeEvent();

  @override
  List<Object> get props => [];
}

class TicTacToeStartGameEvent extends TicTacToeEvent {
  const TicTacToeStartGameEvent();
}

class TicTacToePlayerMoveEvent extends TicTacToeEvent {
  final int position;

  const TicTacToePlayerMoveEvent({
    required this.position,
  });

  @override
  List<Object> get props => [position];
}

class TicTacToeResetGameEvent extends TicTacToeEvent {
  const TicTacToeResetGameEvent();
}