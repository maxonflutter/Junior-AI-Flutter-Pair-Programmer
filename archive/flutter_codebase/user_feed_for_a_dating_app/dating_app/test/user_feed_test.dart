import 'package:flutter_test/flutter_test.dart';
import 'package:dating_app/bloc/user_feed_bloc.dart';
import 'package:dating_app/providers/user_feed_provider.dart';
import 'package:dating_app/screens/user_feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

class MockUserFeedBloc extends MockBloc<UserFeedEvent, UserFeedState> implements UserFeedBloc {}

void main() {
  group('User Feed Functionality', () {
    testWidgets('testUserFeedFunctionality', (tester) async {
      final userFeedBloc = MockUserFeedBloc();
      final userFeedProvider = UserFeedProvider(userFeedBloc: userFeedBloc);

      await tester.pumpWidget(
        MaterialApp(
          home: UserFeedProvider(
            userFeedBloc: userFeedBloc,
            child: UserFeedScreen(),
          ),
        ),
      );

      // Simulate swiping left on the first UserProfileCard
      await tester.drag(find.byType(UserProfileCard).first, Offset(-300, 0));
      await tester.pumpAndSettle();

      // Verify that the UserFeedBloc method for swiping left is called
      verify(() => userFeedBloc.add(const UserSwipedLeft())).called(1);

      // Simulate swiping right on the next UserProfileCard
      await tester.drag(find.byType(UserProfileCard).first, Offset(300, 0));
      await tester.pumpAndSettle();

      // Verify that the UserFeedBloc method for swiping right is called
      verify(() => userFeedBloc.add(const UserSwipedRight())).called(1);

      // Retrieve the swiped UserProfile ids and swipe directions from the local database or file
      final swipedUserProfiles = await userFeedProvider.getSwipedUserProfiles();

      // Verify that the swiped UserProfile ids and swipe directions are saved and retrieved correctly
      expect(swipedUserProfiles[0].swipeDirection, SwipeDirection.left);
      expect(swipedUserProfiles[1].swipeDirection, SwipeDirection.right);
    });
  });
}