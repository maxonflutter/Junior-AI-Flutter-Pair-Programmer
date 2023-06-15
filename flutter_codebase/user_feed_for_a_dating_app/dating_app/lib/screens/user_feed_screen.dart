import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'lib/models/user_profile.dart';
import 'lib/bloc/user_feed_bloc.dart';
import 'lib/widgets/swipeable_card_stack.dart';
import 'lib/widgets/user_profile_card.dart';

class UserFeedScreen extends StatefulWidget {
  @override
  _UserFeedScreenState createState() => _UserFeedScreenState();
}

class _UserFeedScreenState extends State<UserFeedScreen> {
  late UserFeedBloc _userFeedBloc;

  @override
  void initState() {
    super.initState();
    _userFeedBloc = UserFeedBloc();
    _userFeedBloc.fetchUserProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _userFeedBloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('User Feed')),
        body: BlocBuilder<UserFeedBloc, UserFeedState>(
          builder: (context, state) {
            if (state is UserFeedLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserFeedLoaded) {
              return SwipeableCardStack(
                cards: state.userProfiles
                    .map((profile) => UserProfileCard(userProfile: profile))
                    .toList(),
              );
            } else {
              return Center(child: Text('Error loading user feed'));
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userFeedBloc.close();
    super.dispose();
  }
}