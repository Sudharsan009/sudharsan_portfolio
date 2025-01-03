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
        'technologies': [
          'Flutter',
          'Firebase',
          'Riverpod',
          'Cloud Functions',
          "Notifications",
          'Google Map'
        ],
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
        'technologies': ['Flutter', 'Firebase', 'Provider', 'Google Map'],
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
        'technologies': ['Flutter', 'Firebase', 'Cloud Firestore'],
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2, end: 0),
          SizedBox(height: 40),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            itemBuilder: (context, index) => _ProjectCard(
              project: projects[index],
              index: index,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;
  final int index;

  const _ProjectCard({Key? key, required this.project, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 40),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(0.7),
              Colors.purple.withOpacity(0.7)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project['title'],
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        )
                            .animate()
                            .fadeIn(duration: 400.ms)
                            .slideX(begin: -0.2, end: 0),
                        SizedBox(height: 8),
                        Text(
                          'Duration: ${project['duration']}',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white70,
                                  ),
                        ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
                      ],
                    ),
                  ),
                  _TechStack(technologies: project['technologies']),
                ],
              ),
              SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                ),
                items: (project['images'] as List<String>).map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        height: 300, // Adjusted height
                        // width: 200, // Adjusted width
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      );
                    },
                  );
                }).toList(),
              ).animate().scale(
                  delay: 400.ms, duration: 600.ms, curve: Curves.easeOutBack),
              SizedBox(height: 20),
              ...(project['description'] as List<String>).map((item) => Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle, color: Colors.white, size: 18),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            item,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                        .animate()
                        .fadeIn(delay: 600.ms, duration: 400.ms)
                        .slideX(begin: 0.2, end: 0),
                  )),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () async {
                  final url = project['demoLink'] as String;
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                icon: Icon(Icons.play_circle_outline, color: Colors.white),
                label: Text('Watch Demo'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ).animate().scale(delay: 800.ms, duration: 400.ms),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0);
  }
}

class _TechStack extends StatelessWidget {
  final List<String> technologies;

  const _TechStack({Key? key, required this.technologies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.start,
        children: technologies.map((tech) {
          return _TechChip(label: tech);
        }).toList(),
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String label;

  const _TechChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = MediaQuery.of(context).size.width *
            0.4; // Limit width to 40% of the screen
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth), // Dynamic maxWidth
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 12),
              overflow: TextOverflow.ellipsis, // Handle long text
              maxLines: 1, // Limit text to a single line
            ),
          ),
        );
      },
    );
  }
}
