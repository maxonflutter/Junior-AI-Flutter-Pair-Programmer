import 'package:flutter/material.dart';
import 'lib/models/tic_tac_toe_game.dart';
import 'lib/widgets/winner_dialog.dart';

class TicTacToeBoard extends StatefulWidget {
  final TicTacToeGame game;
  final Function(int, int) onTap;

  TicTacToeBoard({required this.game, required this.onTap});

  @override
  _TicTacToeBoardState createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TicTacToeGame>(
      stream: widget.game.stream,
      builder: (BuildContext context, AsyncSnapshot<TicTacToeGame> snapshot) {
        if (snapshot.hasData && snapshot.data!.winner != null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return WinnerDialog(winner: snapshot.data!.winner);
            },
          );
        }

        return GridView.builder(
          itemCount: widget.game.board.length * widget.game.board.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.game.board.length,
          ),
          itemBuilder: (BuildContext context, int index) {
            int row = index ~/ widget.game.board.length;
            int col = index % widget.game.board.length;
            return GestureDetector(
              onTap: () {
                widget.game.play(row, col);
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Center(
                  child: Text(
                    widget.game.board[row][col] == 0
                        ? ''
                        : widget.game.board[row][col] == 1
                            ? 'X'
                            : 'O',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}