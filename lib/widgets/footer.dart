import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socialLinks = [
      {
        'icon': FontAwesomeIcons.github,
        'url': 'https://github.com/Sudharsan009',
        'color': const Color(0xFF333333),
        'label': 'GitHub',
      },
      {
        'icon': FontAwesomeIcons.linkedin,
        'url': 'https://linkedin.com/in/sudharsan-s-988382281/',
        'color': const Color(0xFF0077B5),
        'label': 'LinkedIn',
      },
      // {
      //   'icon': FontAwesomeIcons.instagram,
      //   'url': 'https://instagram.com/yourusername',
      //   'color': const Color(0xFFE4405F),
      //   'label': 'Instagram',
      // },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: socialLinks
                .map((social) => _SocialIcon(
                      icon: social['icon'] as IconData,
                      url: social['url'] as String,
                      color: social['color'] as Color,
                      label: social['label'] as String,
                    ))
                .toList(),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  '© 2024 Sudharsan S. All rights reserved.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                      ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(delay: 200.ms, duration: 600.ms),
                const SizedBox(height: 10),
                Text(
                  'Flutter Developer | Mobile App Enthusiast',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                      ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;
  final Color color;
  final String label;

  const _SocialIcon({
    Key? key,
    required this.icon,
    required this.url,
    required this.color,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: Material(
        elevation: 4,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: () async {
            if (await canLaunch(url)) {
              await launch(url);
            }
          },
          customBorder: const CircleBorder(),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surface,
            ),
            child: FaIcon(
              icon,
              size: 24,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
