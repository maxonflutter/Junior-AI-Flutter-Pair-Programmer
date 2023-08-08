# Example for the Flutter Codebase: Tic Tac Toe App
<p align="left">
  <a href="https://junior.atomsbox.com">
    <img src="../../images/junior-logo-with-bg-2.png" alt="junior by atomsbox"/>
  </a>
</p>

**Learn more at [junior.atomsbox.com](https://junior.atomsbox.com)!**

---

### PROMPT: Create a tic-tac-toe Flutter app. The app should be able to keep track of the users' inputs, display the current board with the Os and Xs, and should display the winner once the game is over. 

- Project name: tic_tac_toe
- Project directory: tic_tac_toe
- Project description: Create a tic-tac-toe Flutter app. The app should be able to keep track of the users' inputs, display the current board with the Os and Xs, and should display the winner once the game is over. 
- Number of tasks: 8
- Model: Advanced Model 

**Full codebase (as created by the model):** [tic_tac_toe](https://github.com/maxonflutter/junior-AI-Generated-Flutter-Code/tree/main/flutter_codebase/tic_tac_toe_app/tic_tac_toe)

![tasks](../../images/tic_tac_toe-app-tasks.png)


### Initial List of Tasks from the Model:
1. Edit existing code to change the MaterialApp title to 'Tic Tac Toe' and the MyHomePage title to 'Tic Tac Toe Game. 
2. description": "Write code to create a new file 'tic_tac_toe/lib/widgets/tic_tac_toe_board.dart' and implement a TicTacToeBoard StatefulWidget that will display the tic-tac-toe board and handle user input.    
3. Write code to create a new file 'tic_tac_toe/lib/models/tic_tac_toe_game.dart' and implement a TicTacToeGame class that will manage the game logic, including checking for a winner and updating the game state.    
4. Edit existing code in 'tic_tac_toe/lib/widgets/tic_tac_toe_board.dart' to import the 'tic_tac_toe_game.dart' file and use the TicTacToeGame class to manage the game state.        
5. Edit existing code in 'tic_tac_toe/lib/main.dart' to import the 'tic_tac_toe_board.dart' file and replace the 'body: Container()' line with 'body: TicTacToeBoard(). 
6. Write code to create a new file 'tic_tac_toe/lib/widgets/winner_dialog.dart' and implement a WinnerDialog StatelessWidget that will display the winner of the game.          
7. Edit existing code in 'tic_tac_toe/lib/widgets/tic_tac_toe_board.dart'.
8. Edit existing code in 'tic_tac_toe/lib/main.dart' to remove the 'const' keyword from the MyApp and MyHomePage constructors


### Final List of Tasks from the Model:
1. "Edit existing code to change the MaterialApp title to 'Tic Tac Toe' and the MyHomePage title to 'Tic Tac Toe Game'. The MaterialApp widget should have a title property set to 'Tic Tac Toe' and the MyHomePage widget should have a title property set to 'Tic Tac Toe Game'.". "In the MaterialApp widget, set the title property to 'Tic Tac Toe'. In the MyHomePage widget, set the title property to 'Tic Tac Toe Game'."
2. "Write code to create a 3x3 grid of buttons for the tic-tac-toe game board inside the body of the Scaffold in the _MyHomePageState class. The grid should be created using a GridView widget with a crossAxisCount of 3. Each cell in the grid should contain a FlatButton widget with an empty string as its child.". "Import the 'GridView' and 'FlatButton' widgets from the 'material.dart' library. Create a new 'GridView' widget with a 'crossAxisCount' of 3 and a 'children' property that contains a list of 9 'FlatButton' widgets with empty strings as their 'child' property. Assign the 'GridView' widget to a new variable called 'gameBoard'. Add the 'gameBoard' widget to the body of the 'Scaffold' widget."
3. "Write code to initialize a 3x3 matrix to store the game state with empty strings in the _MyHomePageState class. The matrix should be initialized as a List of Lists with 3 empty strings in each inner list.". "In order to initialize the 3x3 matrix to store the game state with empty strings, create a new List called 'gameStateMatrix' in the _MyHomePageState class. This List should contain 3 inner Lists, each with 3 empty strings. The code to create the List should look like this: List<List<String>> gameStateMatrix = [ ['', '', ''], ['', '', ''], ['', '', ''], ]; This List will be used to keep track of the state of the game board throughout the game."
4. "Write code to create a boolean variable 'isPlayerOneTurn' in the _MyHomePageState class, initially set to true. This variable will keep track of which player's turn it is.". "In the _MyHomePageState class, create a boolean variable called 'isPlayerOneTurn' and initialize it to true. This variable will keep track of which player's turn it is. It should be used throughout the code to determine which player's symbol to use for each move. Make sure to import the necessary packages for this variable if they haven't been imported yet."
5. "Write code to create a function 'handleButtonClick' in the _MyHomePageState class that takes row and column as arguments and updates the game state matrix and toggles the 'isPlayerOneTurn' variable. This function should update the matrix with the current player's symbol (either 'X' or 'O') at the specified row and column. It should also toggle the 'isPlayerOneTurn' variable to switch to the other player's turn.". "This task requires importing the _MyHomePageState class. The function 'handleButtonClick' should be defined inside the _MyHomePageState class. The function should take two arguments, 'row' and 'column', which represent the position of the button clicked. The function should update the game state matrix with the current player's symbol ('X' or 'O') at the specified row and column. The 'isPlayerOneTurn' variable should be toggled to switch to the other player's turn. If the current player is 'X', the symbol 'O' should be used for the next turn, and vice versa. The matrix should be updated using the setState method to trigger a re-render of the UI. The function should not return anything."
6. "Write code to update the 'handleButtonClick' function to check for a win condition after each move and display a dialog with the winner's name if the game is over. This function should call the 'checkWin' function after each move to determine if there is a winner. If there is a winner, it should display a dialog with the winner's name (either 'Player 1' or 'Player 2').". "The 'handleButtonClick' function needs to call the 'checkWin' function after each move to determine if there is a winner. If there is a winner, it should display a dialog with the winner's name (either 'Player 1' or 'Player 2'). The dialog should have a child Text widget with the message 'Player X/O wins!'."
7. "Write code to update the 'handleButtonClick' function to check for a draw condition after each move and display a dialog if the game is a draw. This function should call the 'isBoardFull' function after each move to determine if the game is a draw. If it is a draw, it should display a dialog with the message 'It's a draw!'.". "In the 'handleButtonClick' function, after updating the game state matrix and toggling the 'isPlayerOneTurn' variable, call the 'isBoardFull' function to check if the game is a draw. If the 'isBoardFull' function returns true, display a dialog with the message 'It's a draw!'. Make sure to import the 'showDialog' function from the 'material.dart' library."
8. "Write code to create a function 'resetGame' in the _MyHomePageState class that resets the game state matrix and the 'isPlayerOneTurn' variable. This function should set the matrix back to its initial state (3x3 matrix with empty strings) and set the 'isPlayerOneTurn' variable back to true.". "The 'resetGame' function needs to be created in the '_MyHomePageState' class. This function should reset the game state matrix and the 'isPlayerOneTurn' variable. The matrix should be initialized as a List of Lists with 3 empty strings in each inner list. The 'isPlayerOneTurn' variable should be set back to true. The function should not take any arguments."
