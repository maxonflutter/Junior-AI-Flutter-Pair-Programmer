import 'package:flutter/material.dart';
import 'package:flutter_wizard/bloc/user_feed_bloc.dart';
import 'package:flutter_wizard/models/user_profile.dart';
import 'package:flutter_wizard/widgets/user_profile_card.dart';

class SwipeableCardStack extends StatefulWidget {
  final List<UserProfileCard> userProfileCards;

  SwipeableCardStack({required this.userProfileCards});

  @override
  _SwipeableCardStackState createState() => _SwipeableCardStackState();
}

class _SwipeableCardStackState extends State<SwipeableCardStack> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  late PageController _pageController;
  late UserFeedBloc _userFeedBloc;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(_animationController);
    _pageController = PageController();
    _userFeedBloc = UserFeedBloc();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    _userFeedBloc.close();
    super.dispose();
  }

  void _onSwipe(UserProfile userProfile, String direction) {
    setState(() {
      _animation = Tween<Offset>(begin: Offset.zero, end: direction == 'left' ? Offset(-2, 0) : Offset(2, 0)).animate(_animationController);
    });

    _animationController.forward().then((_) {
      _animationController.reset();
      _userFeedBloc.saveSwipeData(userProfile.id, direction);
      _pageController.nextPage(duration: Duration(milliseconds: 1), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    _userFeedBloc = UserFeedProvider.of(context);

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity!.abs() > 1000) {
          UserProfile userProfile = widget.userProfileCards[_pageController.page!.toInt()].userProfile;
          _onSwipe(userProfile, details.primaryVelocity! > 0 ? 'right' : 'left');
        }
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return FractionalTranslation(
            translation: _animation.value,
            child: child,
          );
        },
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.userProfileCards.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Open user's profile
              },
              child: widget.userProfileCards[index],
            );
          },
        ),
      ),
    );
  }
}