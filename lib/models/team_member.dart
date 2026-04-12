import 'package:flutter/material.dart';

class TeamMember {
  const TeamMember({
    required this.name,
    required this.country,
    required this.hobbies,
    required this.motto,
    required this.imagePath,
    required this.accentColor,
  });

  final String name;
  final String country;
  final List<String> hobbies;
  final String motto;
  final String imagePath;
  final Color accentColor;
}
