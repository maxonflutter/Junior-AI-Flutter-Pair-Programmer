# Example for the Flutter Codebase: Tic Tac Toe App
<p align="left">
  <a href="https://junior.atomsbox.com">
    <img src="../../images/junior-logo-with-bg-2.png" alt="junior by atomsbox"/>
  </a>
</p>

**Learn more at [junior.atomsbox.com](https://junior.atomsbox.com)!**

---

### PROMPT: Create a simple tic-tac-toe game. Keep all the widgets inside one screen. The app should be able to keep  track of the users' inputs and should display the winner once the game is over. 

- Project name: tic_tac_toe
- Project directory: tic_tac_toe
- Project description: Create a simple tic-tac-toe game. Keep all the widgets inside one screen. The app should be able to keep  track of the users' inputs and should display the winner once the game is over. 
- Number of tasks: 16
- Model: Advanced Model 

**Full codebase (as created by the model):** [tic_tac_toe](https://github.com/maxonflutter/junior-AI-Generated-Flutter-Code/tree/main/flutter_codebase/tic_tac_toe_app/tic_tac_toe)

![tasks](../../images/tic_tac_toe-app-tasks.png)


### Initial List of Tasks from the Model:
1. Edit existing code to change the MaterialApp title to 'Tic Tac Toe' and the MyHomePage title to 'Tic Tac Toe Game'
2. Write code to create a 3x3 grid of buttons for the tic-tac-toe game board inside the body of the Scaffold in the _MyHomePageState class
3. Write code to initialize a 3x3 matrix to store the game state with empty strings in the _MyHomePageState class
4. Write code to create a boolean variable 'isPlayerOneTurn' in the _MyHomePageState class, initially set to true
5. Write code to create a function 'handleButtonClick' in the _MyHomePageState class that takes row and column as arguments and updates the game state matrix and toggles the 'isPlayerOneTurn' variable
6. Write code to update the 'handleButtonClick' function to check for a win condition after each move and display a dialog with the winner's name if the game is over
7. Write code to update the 'handleButtonClick' function to check for a draw condition after each move and display a dialog if the game is a draw
8. Write code to create a function 'resetGame' in the _MyHomePageState class that resets the game state matrix and the 'isPlayerOneTurn' variable
9. Write code to add a RaisedButton below the game board in the _MyHomePageState class that calls the 'resetGame' function when pressed
10. Write code to create a function 'isBoardFull' in the _MyHomePageState class that checks if the game board is full
11. Write code to create a function 'checkWin' in the _MyHomePageState class that checks for a win condition in the game state matrix
12. Write code to update the 'handleButtonClick' function to call 'isBoardFull' and 'checkWin' functions after each move
13. Write code to create a function 'showGameOverDialog' in the _MyHomePageState class that takes a message as an argument and displays a dialog with the message and a 'Play Again' button
14. Write code to update the 'handleButtonClick' function to call 'showGameOverDialog' with the appropriate message when the game is over or a draw
15. Edit existing code to disable the game board buttons when the game is over
16. Write code to add a Text widget above the game board in the _MyHomePageState class that displays the current player's turn

### Final List of Tasks from the Model:
1. 