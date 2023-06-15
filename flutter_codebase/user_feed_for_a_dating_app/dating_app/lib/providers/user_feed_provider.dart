import 'package:flutter/widgets.dart';
import 'package:your_app/bloc/user_feed_bloc.dart';

class UserFeedProvider extends InheritedWidget {
  final UserFeedBloc userFeedBloc;

  UserFeedProvider({required this.userFeedBloc, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(UserFeedProvider oldWidget) {
    return oldWidget.userFeedBloc != userFeedBloc;
  }

  static UserFeedBloc of(BuildContext context) {
    final UserFeedProvider? userFeedProvider =
        context.dependOnInheritedWidgetOfExactType<UserFeedProvider>();

    if (userFeedProvider == null) {
      throw FlutterError('No UserFeedProvider found in the widget tree.');
    }

    return userFeedProvider.userFeedBloc;
  }
}