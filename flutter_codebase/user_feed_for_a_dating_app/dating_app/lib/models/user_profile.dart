import 'package:meta/meta.dart';

class UserProfile {
  const UserProfile({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.bio,
    required this.imageUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      bio: json['bio'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  final int id;
  final String name;
  final int age;
  final String gender;
  final String bio;
  final String imageUrl;
}