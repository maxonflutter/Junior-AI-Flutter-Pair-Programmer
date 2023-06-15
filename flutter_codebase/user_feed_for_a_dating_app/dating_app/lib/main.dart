import 'package:flutter/material.dart';
import 'package:dating_app/models/user_profile.dart';
import 'package:dating_app/providers/user_feed_provider.dart';
import 'package:dating_app/screens/user_feed_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserFeedProvider(
      userFeedBloc: UserFeedBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserFeedScreen(userFeedBloc: UserFeedProvider.of(context)),
    );
  }
}