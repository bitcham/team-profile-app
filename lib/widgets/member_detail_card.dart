import 'package:flutter/material.dart';

import '../models/team_member.dart';
import 'info_row.dart';

class MemberDetailCard extends StatelessWidget {
  const MemberDetailCard({required this.member, super.key});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 760;

          final imagePanel = SizedBox(
            height: isWide ? double.infinity : 280,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(member.imagePath, fit: BoxFit.cover),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        member.accentColor.withValues(alpha: 0.76),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.20),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          member.country,
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        member.name,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );

          final detailPanel = Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Chip(
                      avatar: const Icon(Icons.public_outlined, size: 18),
                      label: Text(member.country),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InfoRow(
                  icon: Icons.person_outline,
                  label: 'Name',
                  value: member.name,
                ),
                const SizedBox(height: 12),
                InfoRow(
                  icon: Icons.home_outlined,
                  label: 'Home country',
                  value: member.country,
                ),
                const SizedBox(height: 20),
                Text(
                  'Hobbies',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: member.hobbies
                      .map((hobby) => Chip(label: Text(hobby)))
                      .toList(),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: member.accentColor.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.format_quote_rounded,
                        color: member.accentColor,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          member.motto,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: member.accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );

          return isWide
              ? Row(
                  children: [
                    Expanded(flex: 5, child: imagePanel),
                    Expanded(flex: 6, child: detailPanel),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [imagePanel, detailPanel],
                );
        },
      ),
    );
  }
}
