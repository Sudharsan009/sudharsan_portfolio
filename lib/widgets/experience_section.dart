import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2, end: 0),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return _buildDesktopLayout(context);
              } else {
                return _buildMobileLayout(context);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return SingleChildScrollView(
      // Added this line to allow scrolling
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8), // Adjusted padding
                  child: _buildWorkExperience(context),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8), // Adjusted padding
                  child: _buildInternships(context),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8), // Adjusted padding
                  child: _buildCertifications(context),
                ),
              ],
            ),
          ),
          const SizedBox(width: 90),
          Expanded(
            flex: 1,
            child: Lottie.asset(
              'assets/lottie/work_experience.json',
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          'assets/lottie/work_experience.json',
          height: 200,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 40),
        _buildWorkExperience(context),
        const SizedBox(height: 40),
        _buildInternships(context),
        const SizedBox(height: 40),
        _buildCertifications(context),
      ],
    );
  }

  Widget _buildWorkExperience(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Work Experience',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2, end: 0),
        const SizedBox(height: 20),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          isFirst: true,
          indicatorStyle: IndicatorStyle(
            width: 20,
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(6),
          ),
          endChild: _ExperienceCard(
            company: 'Jk global IT solution',
            position: 'Flutter Developer',
            duration: 'May 2024 - Dec 2024',
            responsibilities: [
              'Developing and maintaining high performance mobile applications using Flutter for both iOS and Android platforms.',
              'Collaborating with cross-functional teams to gather and analyze requirements, ensuring alignment with client expectations.',
              'Implementing responsive UI designs and enhancing user experience through innovative features and functionality.',
            ],
          )
              .animate()
              .fadeIn(delay: 200.ms, duration: 600.ms)
              .slideX(begin: 0.2, end: 0),
          beforeLineStyle: LineStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildInternships(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Internships',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2, end: 0),
        const SizedBox(height: 20),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          isFirst: true,
          indicatorStyle: IndicatorStyle(
            width: 20,
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(6),
          ),
          endChild: _ExperienceCard(
            company: 'CodeBind Technologies',
            position: 'Web Development Intern',
            duration: '5 Days',
            responsibilities: [
              'Acquired expertise in web development to design attractive and user-friendly frontend interfaces.'
            ],
          )
              .animate()
              .fadeIn(delay: 200.ms, duration: 600.ms)
              .slideX(begin: 0.2, end: 0),
          beforeLineStyle: LineStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildCertifications(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Certifications',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2, end: 0),
        const SizedBox(height: 20),
        _CertificationCard(
          title: 'Flutter Development Course',
          issuer: 'Elysium Academy, Coimbatore',
          duration: 'September 2023 - February 2024',
          description:
              'Comprehensive course covering Flutter app development, Dart programming, and mobile app design principles.',
        )
            .animate()
            .fadeIn(delay: 200.ms, duration: 600.ms)
            .slideY(begin: 0.2, end: 0),
      ],
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final String company;
  final String position;
  final String duration;
  final List<String> responsibilities;

  const _ExperienceCard({
    Key? key,
    required this.company,
    required this.position,
    required this.duration,
    required this.responsibilities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              company,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            Text(
              position,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            Text(
              duration,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
            ),
            const SizedBox(height: 8),
            ...responsibilities.map((responsibility) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('• ',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary)),
                      Expanded(
                        child: Text(
                          responsibility,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class _CertificationCard extends StatelessWidget {
  final String title;
  final String issuer;
  final String duration;
  final String description;

  const _CertificationCard({
    Key? key,
    required this.title,
    required this.issuer,
    required this.duration,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              '$issuer - $duration',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
