import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'HRiFY',
        'duration': '2 Months',
        'description': [
          'Implemented core modules including employee management, attendance tracking, leave management, and payroll processing',
          'Designed an intuitive dashboard for quick access to critical HR data and pending requests',
          'Developed a secure, role-based access system to protect sensitive employee information',
          'Created a flexible payroll system capable of handling custom salary structures and deductions',
          'Integrated mobile functionality for employee self-service, including attendance logging and leave requests'
        ],
        'images': [
          'assets/images/hrify_1.jpg',
          'assets/images/hrify_2.jpg',
          'assets/images/hrify_3.jpg',
          'assets/images/hrify_4.jpg',
        ],
        'demoLink':
            'https://drive.google.com/file/d/1-z7mrGdwcO8r-ctzX1iGE6LXU8CrMAwb/view?usp=drive_link',
      },
      {
        'title': 'Hotel Booking App',
        'duration': '70 Days',
        'description': [
          'Created a dual-purpose Room Booking App consisting of an admin panel for entering hotel details and a user application for real-time bookings.',
          'The admin app allows hotel management to update room availability, pricing, and amenities efficiently.',
          'The user app enables real-time booking, with features like a calendar view, customize rooms and instant notifications.'
        ],
        'images': [
          'assets/images/hotel_booking_1.jpg',
          'assets/images/hotel_booking_2.jpeg',
          'assets/images/hotel_booking_3.jpeg',
          'assets/images/hotel_booking_4.jpeg',
        ],
        'demoLink':
            'https://drive.google.com/file/d/1GvcDrlHW-kbQM0BVo705waoTef0b1nv1/view?usp=drive_link',
      },
      {
        'title': 'E-Learning App',
        'duration': '20 Days',
        'description': [
          'E-Learning apps students can access lessons and training materials in their own time online.',
          'Teachers can pre-record lessons and distribute them online.',
          'You don\'t have to leave the app to get an immersive learning experience, because it has everything you could possibly need: a video player, a tab for courses and assignments.'
        ],
        'images': [
          'assets/images/learner_1.jpg',
          'assets/images/learner_2.jpg',
          'assets/images/learner_3.jpg',
          'assets/images/learner_4.jpg',
        ],
        'demoLink': '',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2, end: 0),
          const SizedBox(height: 40),
          ...projects.map((project) => _ProjectCard(project: project)).toList(),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;

  const _ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 40),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project['title'],
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.2, end: 0),
            Text(
              'Duration: ${project['duration']}',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
            ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
            const SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: (project['images'] as List<String>).map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(item),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                        .animate()
                        .scale(duration: 400.ms, curve: Curves.easeOutBack);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ...(project['description'] as List<String>).map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('• ',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary)),
                      Expanded(
                        child: Text(
                          item,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                    ],
                  )
                      .animate()
                      .fadeIn(delay: 400.ms, duration: 400.ms)
                      .slideX(begin: 0.2, end: 0),
                )),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () async {
                final url = project['demoLink'] as String;
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
              icon: const Icon(
                Icons.play_circle_outline,
                color: Colors.white,
              ),
              label: const Text('Watch Demo'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ).animate().scale(delay: 600.ms, duration: 400.ms),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0);
  }
}
