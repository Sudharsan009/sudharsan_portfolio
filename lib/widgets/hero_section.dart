import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return _buildDesktopHero(context);
        } else {
          return _buildMobileHero(context);
        }
      },
    );
  }

  Widget _buildDesktopHero(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to my portfolio',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideX(begin: -0.2, end: 0),
                  const SizedBox(height: 20),
                  Text(
                    'Sudharsan S',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 300.ms)
                      .slideX(begin: -0.2, end: 0),
                  const SizedBox(height: 20),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flutter Developer',
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white70),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Mobile App Enthusiast',
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white70),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    totalRepeatCount: 3,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ).animate().fadeIn(duration: 600.ms, delay: 600.ms),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://drive.google.com/file/d/18DGRRmAYwsjGsoX0Mr7RUy5s1Zp5ml1o/view?usp=drive_link';
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: const Text('View Resume'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ).animate().scale(delay: 900.ms, duration: 400.ms),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile_picture.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMobileHero(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile_picture.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
          ),
          const SizedBox(height: 30),
          Text(
            'Welcome to my portfolio',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 20),
          Text(
            'Sudharsan S',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          )
              .animate()
              .fadeIn(duration: 600.ms, delay: 300.ms)
              .slideY(begin: 0.2, end: 0),
          const SizedBox(height: 20),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Flutter Developer',
                textStyle: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.white70),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'Mobile App Enthusiast',
                textStyle: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.white70),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 3,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ).animate().fadeIn(duration: 600.ms, delay: 600.ms),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              const url =
                  'https://drive.google.com/file/d/18DGRRmAYwsjGsoX0Mr7RUy5s1Zp5ml1o/view?usp=drive_link';
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
            child: const Text('View Resume'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.primary,
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: const TextStyle(fontSize: 16),
            ),
          ).animate().scale(delay: 900.ms, duration: 400.ms),
        ],
      ),
    );
  }
}
