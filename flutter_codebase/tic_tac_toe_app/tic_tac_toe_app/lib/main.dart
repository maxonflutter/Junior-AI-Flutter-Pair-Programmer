import 'package:flutter/material.dart';
import 'lib/widgets/tic_tac_toe_board.dart';
import 'lib/models/tic_tac_toe_game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Tic Tac Toe Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: TicTacToeBoard(
        board: [
          [0, 0, 0],
          [0, 0, 0],
          [0, 0, 0]
        ],
        game: TicTacToeGame([
          [0, 0, 0],
          [0, 0, 0],
          [0, 0, 0]
        ]),
      ),
    );
  }
}