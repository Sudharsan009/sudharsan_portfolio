import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final skills = [
      {
        'name': 'Flutter',
        'icon': FontAwesomeIcons.flutter,
        'color': Colors.blue
      },
      {
        'name': 'Dart',
        'icon': FontAwesomeIcons.code,
        'color': Colors.blue.shade700
      },
      {
        'name': 'Firebase',
        'icon': FontAwesomeIcons.fire,
        'color': Colors.orange
      },
      {
        'name': 'Google Maps',
        'icon': FontAwesomeIcons.mapMarkedAlt,
        'color': Colors.green
      },
      {
        'name': 'Android',
        'icon': FontAwesomeIcons.android,
        'color': Colors.green.shade700
      },
      {'name': 'iOS', 'icon': FontAwesomeIcons.apple, 'color': Colors.grey},
      {
        'name': 'HTML',
        'icon': FontAwesomeIcons.html5,
        'color': Colors.orange.shade700
      },
      {
        'name': 'CSS',
        'icon': FontAwesomeIcons.css3,
        'color': Colors.blue.shade600
      },
      {
        'name': 'Git',
        'icon': FontAwesomeIcons.gitAlt,
        'color': Colors.red.shade700
      },
      {
        'name': 'RESTful APIs',
        'icon': FontAwesomeIcons.server,
        'color': Colors.purple
      },
      {
        'name': 'UI/UX Design',
        'icon': FontAwesomeIcons.paintBrush,
        'color': Colors.pink
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2, end: 0),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              return StaggeredGrid.count(
                crossAxisCount: constraints.maxWidth > 800 ? 4 : 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: List.generate(skills.length, (index) {
                  final skill = skills[index];
                  return StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: SkillCard(
                      name: skill['name'] as String,
                      icon: skill['icon'] as IconData,
                      color: skill['color'] as Color,
                    )
                        .animate()
                        .scale(delay: (100 * index).ms, duration: 400.ms),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;

  const SkillCard({
    Key? key,
    required this.name,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, size: 40, color: color)
                .animate()
                .scale(delay: 200.ms, duration: 300.ms),
            const SizedBox(height: 12),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ).animate().fadeIn(delay: 300.ms, duration: 300.ms),
          ],
        ),
      ),
    ).animate().slideY(begin: 0.2, end: 0, delay: 100.ms, duration: 500.ms);
  }
}
