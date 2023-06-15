// PROMPT: Create a BLoC to handle a simple tic-tac-toe game. Keep track of 
// the users' inputs and display the winner once the game is over. 

// Output from: https://junior.atomsbox.com/#/bloc-generator

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tic_tac_toe_event.dart';
part 'tic_tac_toe_state.dart';

class TicTacToeBloc extends Bloc<TicTacToeEvent, TicTacToeState> {
  TicTacToeBloc() : super(TicTacToeState.initial()) {
    on<TicTacToeStartGameEvent>(_onStartGameEvent);
    on<TicTacToePlayerMoveEvent>(_onPlayerMoveEvent);
    on<TicTacToeResetGameEvent>(_onResetGameEvent);
  }

  Future<void> _onStartGameEvent(
    TicTacToeStartGameEvent event,
    Emitter<TicTacToeState> emit,
  ) async {
    emit(TicTacToeState.initial());
  }

  Future<void> _onPlayerMoveEvent(
    TicTacToePlayerMoveEvent event,
    Emitter<TicTacToeState> emit,
  ) async {
    final updatedBoard = List<List<String>>.from(state.gameBoard);
    updatedBoard[event.row][event.column] = state.currentPlayer;

    final winner = _checkWinner(updatedBoard);

    if (winner != null) {
      emit(state.copyWith(
        gameBoard: updatedBoard,
        winner: winner,
        status: winner == 'X' ? TicTacToeStatus.player1_win : TicTacToeStatus.player2_win,
      ));
    } else if (_isBoardFull(updatedBoard)) {
      emit(state.copyWith(
        gameBoard: updatedBoard,
        status: TicTacToeStatus.draw,
      ));
    } else {
      emit(state.copyWith(
        gameBoard: updatedBoard,
        currentPlayer: state.currentPlayer == 'X' ? 'O' : 'X',
        status: state.currentPlayer == 'X'
            ? TicTacToeStatus.player2_turn
            : TicTacToeStatus.player1_turn,
      ));
    }
  }

  Future<void> _onResetGameEvent(
    TicTacToeResetGameEvent event,
    Emitter<TicTacToeState> emit,
  ) async {
    emit(TicTacToeState.initial());
  }

  String? _checkWinner(List<List<String>> board) {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0] != '') {
        return board[i][0];
      }

      if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i] != '') {
        return board[0][i];
      }
    }

    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0] != '') {
      return board[0][0];
    }

    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2] != '') {
      return board[0][2];
    }

    return null;
  }

  bool _isBoardFull(List<List<String>> board) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          return false;
        }
      }
    }
    return true;
  }
}
