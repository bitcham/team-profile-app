import 'package:flutter/material.dart';

import '../data/team_data.dart';
import 'member_detail_card.dart';
import 'step_button.dart';

class MembersSection extends StatelessWidget {
  const MembersSection({
    required this.pageController,
    required this.selectedMemberIndex,
    required this.onPageChanged,
    required this.onPrevious,
    required this.onNext,
    super.key,
  });

  final PageController pageController;
  final int selectedMemberIndex;
  final ValueChanged<int> onPageChanged;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final member = teamMembers[selectedMemberIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    avatar: const Icon(Icons.groups_outlined, size: 18),
                    label: Text('${teamInfo.memberCount} members'),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    teamInfo.name,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    teamInfo.description,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Swipe between members',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Click the arrows or swipe left and right to move through all 5 team members.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      StepButton(
                        icon: Icons.arrow_back_rounded,
                        label: 'Previous',
                        onPressed: selectedMemberIndex == 0 ? null : onPrevious,
                      ),
                      StepButton(
                        icon: Icons.arrow_forward_rounded,
                        label: 'Next',
                        onPressed: selectedMemberIndex == teamMembers.length - 1
                            ? null
                            : onNext,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 690,
            child: PageView.builder(
              controller: pageController,
              itemCount: teamMembers.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: MemberDetailCard(member: teamMembers[index]),
                );
              },
            ),
          ),
          const SizedBox(height: 18),
          Center(
            child: Wrap(
              spacing: 10,
              children: List.generate(teamMembers.length, (index) {
                final isActive = index == selectedMemberIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  width: isActive ? 28 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: isActive
                        ? member.accentColor
                        : theme.colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(999),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
