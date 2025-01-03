import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';

class Header extends ConsumerWidget {
  final Function(int) onMenuItemTap;
  final ValueNotifier<int> activeSection;

  const Header({
    Key? key,
    required this.onMenuItemTap,
    required this.activeSection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.transparent,
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Sudharsan S',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            if (!isMobile)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMenuItem(context, 'Home', 0),
                  _buildMenuItem(context, 'About', 1),
                  _buildMenuItem(context, 'Skills', 2),
                  _buildMenuItem(context, 'Experience', 3),
                  _buildMenuItem(context, 'Projects', 4),
                  _buildMenuItem(context, 'Education', 5),
                  _buildMenuItem(context, 'Contact', 6),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                    onPressed: () {
                      ref.read(darkModeProvider.notifier).state = !isDarkMode;
                    },
                  ),
                ],
              ),
            if (isMobile)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                    onPressed: () {
                      ref.read(darkModeProvider.notifier).state = !isDarkMode;
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 500.ms)
        .slideY(begin: -1, end: 0, duration: 500.ms, curve: Curves.easeOutQuad);
  }

  Widget _buildMenuItem(BuildContext context, String title, int index) {
    return ValueListenableBuilder<int>(
      valueListenable: activeSection,
      builder: (context, activeIndex, child) {
        final isActive = activeIndex == index;
        return InkWell(
          onTap: () => onMenuItemTap(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color:
                        isActive ? Theme.of(context).colorScheme.primary : null,
                    fontWeight: isActive ? FontWeight.bold : null,
                  ),
            ),
          ),
        );
      },
    );
  }
}

class CustomNavigationDrawer extends ConsumerWidget {
  final Function(int) onMenuItemTap;
  final ValueNotifier<int> activeSection;

  const CustomNavigationDrawer({
    Key? key,
    required this.onMenuItemTap,
    required this.activeSection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/images/profile_picture.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Sudharsan S',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(context, 'Home', Icons.home, 0),
                _buildDrawerItem(context, 'About', Icons.person, 1),
                _buildDrawerItem(context, 'Skills', Icons.code, 2),
                _buildDrawerItem(context, 'Experience', Icons.work, 3),
                _buildDrawerItem(context, 'Projects', Icons.folder, 4),
                _buildDrawerItem(context, 'Education', Icons.school, 5),
                _buildDrawerItem(context, 'Contact', Icons.email, 6),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, String title, IconData icon, int index) {
    return ValueListenableBuilder<int>(
      valueListenable: activeSection,
      builder: (context, activeIndex, child) {
        final isActive = activeIndex == index;
        return ListTile(
          leading: Icon(icon,
              color: isActive ? Theme.of(context).colorScheme.primary : null),
          title: Text(
            title,
            style: TextStyle(
              color: isActive ? Theme.of(context).colorScheme.primary : null,
              fontWeight: isActive ? FontWeight.bold : null,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            onMenuItemTap(index);
          },
        );
      },
    );
  }
}
