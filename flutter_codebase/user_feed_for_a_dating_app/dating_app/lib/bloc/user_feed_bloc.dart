import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dating_app/models/user_profile.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class UserFeedBloc {
  final _userFeedController = StreamController<List<UserProfile>>.broadcast();

  Stream<List<UserProfile>> get userFeedStream => _userFeedController.stream;

  void fetchUserProfiles() async {
    try {
      // Fetch user profiles from API or local storage
      List<UserProfile> userProfiles = []; // Replace with actual fetched data

      // Add some sample UserProfile objects
      userProfiles.add(UserProfile(id: 1, name: 'Alice', age: 25));
      userProfiles.add(UserProfile(id: 2, name: 'Bob', age: 30));

      _userFeedController.sink.add(userProfiles);
    } catch (error) {
      _userFeedController.sink.addError(error);
    }
  }

  void handleSwipe(UserProfile userProfile, bool isRightSwipe) {
    // Remove swiped user profile from the list
    _userFeedController.value.remove(userProfile);

    // Add a new user profile to the list
    UserProfile newUserProfile = UserProfile(); // Replace with actual fetched data
    _userFeedController.value.add(newUserProfile);

    // Save swiped user profile's id and swipe direction to local database or file
    int userId = userProfile.id;
    String direction = isRightSwipe ? 'right' : 'left';
    saveSwipeData(userId, direction);
  }

  Future<void> saveSwipeData(int id, String direction) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = join(directory.path, 'swipe_data.json');
      final file = File(path);

      List<Map<String, dynamic>> swipeDataList = [];

      if (await file.exists()) {
        String contents = await file.readAsString();
        swipeDataList = List<Map<String, dynamic>>.from(jsonDecode(contents));
      }

      swipeDataList.add({'id': id, 'direction': direction});
      await file.writeAsString(jsonEncode(swipeDataList));
    } catch (error) {
      print('Error saving swipe data: $error');
    }
  }

  Future<List<Map<String, dynamic>>> getSwipeData(String path) async {
    List<Map<String, dynamic>> swipeDataList = [];

    try {
      final file = File(path);

      if (await file.exists()) {
        String contents = await file.readAsString();
        swipeDataList = List<Map<String, dynamic>>.from(jsonDecode(contents));
      }
    } catch (error) {
      print('Error retrieving swipe data: $error');
    }

    return swipeDataList;
  }

  void dispose() {
    _userFeedController.close();
  }
}