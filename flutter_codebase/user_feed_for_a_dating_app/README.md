# Example for the Flutter Codebase tool
**Learn more at [junior.atomsbox.com](https://junior.atomsbox.com)!**

---

### PROMPT: Create the user feed feature for a dating app with Flutter. The current user should be able to swipe left and right the other users' profiles. Create only one screen and starts by developing the user profile model. 

- Project name: dating_app
- Project directory: dating_app
- Project description: Create the user feed feature for a dating app with Flutter. The current user should be able to swipe left and right the other users' profiles. Create only one screen and starts by developing the user profile model. 
- Number of tasks: 16
- Model: Advanced Model 

<p align="left">
  <a href="https://junior.atomsbox.com">
    <img src="images/junior-logo-with-bg-2.png" alt="junior by atomsbox"/>
  </a>
</p>


![tasks](images/user-feed-for-dating-app-tasks.png)


### Initial List of Tasks from the Model:
1. Edit existing code to remove the appBar from MyHomePage and change the Scaffold background color to Theme.of(context).colorScheme.background
2. Write code to create a UserProfile class with attributes: id, name, age, gender, bio, and imageUrl
3. Write code to create a UserProfileCard widget that takes a UserProfile object as a parameter and displays the user's name, age, gender, bio, and imageUrl
4. Write code to create a UserFeedBloc class with a StreamController for managing the user feed
5. Write code to create a method in UserFeedBloc that fetches a list of UserProfile objects and adds them to the StreamController
6. Write code to create a UserFeedProvider class that uses InheritedWidget to provide the UserFeedBloc to its descendants
7. Edit existing code to wrap the MaterialApp widget with a UserFeedProvider in MyApp
8. Write code to create a SwipeableCardStack widget that takes a list of UserProfileCard widgets and allows the user to swipe left or right
9. Write code to create a UserFeedScreen StatefulWidget that displays a SwipeableCardStack with UserProfileCard widgets
10. Edit existing code to replace the Container in the body of _MyHomePageState with the UserFeedScreen widget
11. Write code to create a method in UserFeedBloc that handles swiping left or right on a UserProfileCard by removing it from the list and adding a new UserProfile to the list
12. Edit existing code to call the method from task 11 when a UserProfileCard is swiped left or right in the SwipeableCardStack widget
13. Write code to create a method in UserFeedBloc that saves the swiped UserProfile's id and swipe direction (left or right) to a local database or file
14. Edit existing code to call the method from task 13 when a UserProfileCard is swiped left or right in the SwipeableCardStack widget
15. Write code to create a method in UserFeedBloc that retrieves the saved swipe data from the local database or file and returns a list of swiped UserProfile ids and their swipe direction
16. Write code to create a test function that verifies the functionality of the UserFeedBloc methods and the UserFeedScreen


### Final List of Tasks from the Model:
