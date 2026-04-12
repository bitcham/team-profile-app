import 'package:flutter/material.dart';

import '../models/team_info.dart';
import '../models/team_member.dart';

const teamInfo = TeamInfo(
  name: 'teamName1',
  description:
      'teamDescription1. This Material 3 profile app introduces the team, highlights the project direction, and lets the user browse each member with swipe navigation.',
  memberCount: 5,
);

const teamMembers = [
  TeamMember(
    name: 'Chambit Oh',
    country: 'South Korea',
    hobbies: ['Climbing', 'Programming'],
    motto: 'Just do the best',
    imagePath: 'assets/images/member_1.png',
    accentColor: Color(0xFF0F766E),
  ),
  TeamMember(
    name: 'name2',
    country: 'country2',
    hobbies: ['hobby4', 'hobby5', 'hobby6'],
    motto: 'motto2',
    imagePath: 'assets/images/member_2.png',
    accentColor: Color(0xFF2563EB),
  ),
  TeamMember(
    name: 'name3',
    country: 'country3',
    hobbies: ['hobby7', 'hobby8', 'hobby9'],
    motto: 'motto3',
    imagePath: 'assets/images/member_3.png',
    accentColor: Color(0xFFEA580C),
  ),
  TeamMember(
    name: 'name4',
    country: 'country4',
    hobbies: ['hobby10', 'hobby11', 'hobby12'],
    motto: 'motto4',
    imagePath: 'assets/images/member_4.png',
    accentColor: Color(0xFF7C3AED),
  ),
  TeamMember(
    name: 'name5',
    country: 'country5',
    hobbies: ['hobby13', 'hobby14', 'hobby15'],
    motto: 'motto5',
    imagePath: 'assets/images/member_5.png',
    accentColor: Color(0xFFB91C1C),
  ),
];
