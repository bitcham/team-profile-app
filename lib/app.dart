import 'package:flutter/material.dart';

import 'screens/team_profile_home.dart';

class TeamProfileApp extends StatelessWidget {
  const TeamProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F766E),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F4EE),
      ),
      home: const TeamProfileHome(),
    );
  }
}
