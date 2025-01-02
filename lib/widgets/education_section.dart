import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final education = [
      {
        'year': '2023',
        'degree': 'B.Tech/B.E.',
        'institution': 'KSK College of Engineering and Technology, Thanjavur'
      },
      {'year': '2019', 'degree': 'XIIth', 'institution': 'English'},
      {'year': '2017', 'degree': 'Xth', 'institution': 'English'}
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2, end: 0),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return _buildDesktopLayout(context, education);
              } else {
                return _buildMobileLayout(context, education);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(
      BuildContext context, List<Map<String, String>> education) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: education.length,
            itemBuilder: (context, index) {
              final edu = education[index];
              return TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                isFirst: index == 0,
                isLast: index == education.length - 1,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  color: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.all(6),
                ),
                endChild: _EducationCard(
                  year: edu['year']!,
                  degree: edu['degree']!,
                  institution: edu['institution']!,
                )
                    .animate()
                    .fadeIn(delay: (200 * index).ms, duration: 600.ms)
                    .slideX(begin: 0.2, end: 0),
                beforeLineStyle: LineStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 40),
        // Expanded(
        //   child: Lottie.asset(
        //     'assets/lottie/education.json',
        //     height: 300,
        //     fit: BoxFit.contain,
        //   ).animate().scale(delay: 400.ms, duration: 600.ms),
        // ),
        Expanded(
            child: Lottie.asset(
          'assets/lottie/education.json',
          height: 300,
          fit: BoxFit.contain,
        )),
      ],
    );
  }

  Widget _buildMobileLayout(
      BuildContext context, List<Map<String, String>> education) {
    return Column(
      children: [
        Lottie.asset(
          'assets/lottie/education.json',
          height: 200,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 40),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: education.length,
          itemBuilder: (context, index) {
            final edu = education[index];
            return TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              isFirst: index == 0,
              isLast: index == education.length - 1,
              indicatorStyle: IndicatorStyle(
                width: 20,
                color: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.all(6),
              ),
              endChild: _EducationCard(
                year: edu['year']!,
                degree: edu['degree']!,
                institution: edu['institution']!,
              )
                  .animate()
                  .fadeIn(delay: (200 * index).ms, duration: 600.ms)
                  .slideY(begin: 0.2, end: 0),
              beforeLineStyle: LineStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _EducationCard extends StatelessWidget {
  final String year;
  final String degree;
  final String institution;

  const _EducationCard({
    Key? key,
    required this.year,
    required this.degree,
    required this.institution,
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
              degree,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            Text(
              institution,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            Text(
              'Year: $year',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
