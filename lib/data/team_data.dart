import 'package:flutter/material.dart';

import '../models/team_info.dart';
import '../models/team_member.dart';

const teamInfo = TeamInfo(
  name: 'NoOneKnows',
  description:
      'NoOneKnows. This Material 3 profile app introduces the team, highlights the project direction, and lets the user browse each member with swipe navigation.',
  memberCount: 5,
);

const teamMembers = [
  TeamMember(
    name: 'Chambit Oh',
    country: 'South Korea',
    hobbies: ['Climbing', 'Programming'],
    motto: 'Just do the best',
    imagePath: 'assets/images/cham.jpeg',
    accentColor: Color(0xFF0F766E),
  ),
  TeamMember(
    name: 'Beril Ülker',
    country: 'Türkiye',
    hobbies: ['Swimming'],
    motto: 'Carpe diem',
    imagePath: 'assets/images/beril.jpeg',
    accentColor: Color(0xFF2563EB),
  ),
  TeamMember(
    name: 'Md Abdur Rahim',
    country: 'Bangladesh',
    hobbies: ['Travelling'],
    motto: 'I can do it- build, fail, learn and repeat.',
    imagePath: 'assets/images/rahim.jpeg',
    accentColor: Color(0xFFEA580C),
  ),
  TeamMember(
    name: 'Younes El Uaski',
    country: 'Germany',
    hobbies: ['Sport'],
    motto: 'Believe in yourself',
    imagePath: 'assets/images/younes.jpeg',
    accentColor: Color(0xFF7C3AED),
  ),
  TeamMember(
    name: 'Nisanur Coskungönül',
    country: 'Türkiye',
    hobbies: ['drawing', 'reading'],
    motto: 'say less, do more',
    imagePath: 'assets/images/nisa.jpeg',
    accentColor: Color(0xFFB91C1C),
  ),
];
