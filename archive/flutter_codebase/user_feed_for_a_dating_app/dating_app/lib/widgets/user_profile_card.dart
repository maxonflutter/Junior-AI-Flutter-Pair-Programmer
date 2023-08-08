import 'package:flutter/material.dart';
import 'package:your_app/models/user_profile.dart';

class UserProfileCard extends StatelessWidget {
  final UserProfile userProfile;

  UserProfileCard({required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 48.0,
              backgroundImage: userProfile.imageUrl != null
                  ? NetworkImage(userProfile.imageUrl!)
                  : AssetImage('assets/images/default_avatar.png'),
            ),
            SizedBox(height: 8.0),
            Text(
              userProfile.name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              '${userProfile.age} years old',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 4.0),
            Text(
              userProfile.gender,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 4.0),
            Text(
              userProfile.bio,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}