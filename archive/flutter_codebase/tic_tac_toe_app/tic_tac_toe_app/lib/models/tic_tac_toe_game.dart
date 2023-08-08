import 'package:flutter/material.dart';

class TicTacToeGame {
  List<List<int>> board;
  int currentPlayer;

  TicTacToeGame(this.board) {
    currentPlayer = 1;
  }

  String? play(int row, int column) {
    if (board[row][column] == 0) {
      board[row][column] = currentPlayer;

      if (_checkWinner(row, column)) {
        return currentPlayer == 1 ? 'X' : 'O';
      }

      currentPlayer = 3 - currentPlayer;
    }

    return null;
  }

  bool _checkWinner(int row, int column) {
    int player = board[row][column];

    // Check row
    bool rowWin = true;
    for (int i = 0; i < 3; i++) {
      if (board[row][i] != player) {
        rowWin = false;
        break;
      }
    }

    if (rowWin) return true;

    // Check column
    bool colWin = true;
    for (int i = 0; i < 3; i++) {
      if (board[i][column] != player) {
        colWin = false;
        break;
      }
    }

    if (colWin) return true;

    // Check diagonal
    if (row == column) {
      bool diagWin = true;
      for (int i = 0; i < 3; i++) {
        if (board[i][i] != player) {
          diagWin = false;
          break;
        }
      }

      if (diagWin) return true;
    }

    // Check anti-diagonal
    if (row + column == 2) {
      bool antiDiagWin = true;
      for (int i = 0; i < 3; i++) {
        if (board[i][2 - i] != player) {
          antiDiagWin = false;
          break;
        }
      }

      if (antiDiagWin) return true;
    }

    return false;
  }
}