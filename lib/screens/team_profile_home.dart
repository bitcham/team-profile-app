import 'package:flutter/material.dart';

import '../data/team_data.dart';
import '../widgets/members_section.dart';

class TeamProfileHome extends StatefulWidget {
  const TeamProfileHome({super.key});

  @override
  State<TeamProfileHome> createState() => _TeamProfileHomeState();
}

class _TeamProfileHomeState extends State<TeamProfileHome> {
  final PageController _pageController = PageController(viewportFraction: 0.92);
  int _selectedMemberIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectMember(int index, {bool animate = true}) {
    if (index < 0 || index >= teamMembers.length) {
      return;
    }

    setState(() {
      _selectedMemberIndex = index;
    });

    void syncPage() {
      if (!_pageController.hasClients) {
        return;
      }

      if (animate) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 320),
          curve: Curves.easeOutCubic,
        );
        return;
      }

      _pageController.jumpToPage(index);
    }

    if (_pageController.hasClients) {
      syncPage();
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      syncPage();
    });
  }

  void _stepMember(int direction) {
    final nextIndex = (_selectedMemberIndex + direction).clamp(
      0,
      teamMembers.length - 1,
    );
    _selectMember(nextIndex);
  }

  void _showRosterSheet() {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (context) {
        return SafeArea(
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            itemCount: teamMembers.length,
            separatorBuilder: (_, __) => const Divider(height: 20),
            itemBuilder: (context, index) {
              final member = teamMembers[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(member.imagePath),
                ),
                title: Text(member.name),
                subtitle: Text(member.country),
                trailing: index == _selectedMemberIndex
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).pop();
                  _selectMember(index, animate: false);
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(teamInfo.name),
            Text(
              'Material UI Team Profile',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE6F4F1), Color(0xFFF6F4EE)],
          ),
        ),
        child: SafeArea(
          child: MembersSection(
            pageController: _pageController,
            selectedMemberIndex: _selectedMemberIndex,
            onPageChanged: (index) {
              setState(() {
                _selectedMemberIndex = index;
              });
            },
            onPrevious: () => _stepMember(-1),
            onNext: () => _stepMember(1),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showRosterSheet,
        icon: const Icon(Icons.groups_2_outlined),
        label: const Text('Roster'),
      ),
    );
  }
}
