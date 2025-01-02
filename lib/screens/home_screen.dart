import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/education_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/hero_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ValueNotifier<int> _activeSection = ValueNotifier<int>(0);
  final List<Widget> _sections = const [
    HeroSection(),
    AboutSection(),
    SkillsSection(),
    ExperienceSection(),
    ProjectsSection(),
    EducationSection(),
    ContactSection(),
    Footer(),
  ];

  @override
  void dispose() {
    _activeSection.dispose();
    super.dispose();
  }

  Future<void> _scrollToSection(int index) async {
    if (!_itemScrollController.isAttached) return;

    await _itemScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
    _activeSection.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomNavigationDrawer(
        onMenuItemTap: _scrollToSection,
        activeSection: _activeSection,
      ),
      body: Stack(
        children: [
          ScrollablePositionedList.builder(
            itemCount: _sections.length,
            itemScrollController: _itemScrollController,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return VisibilityDetector(
                key: Key('section_$index'),
                onVisibilityChanged: (visibilityInfo) {
                  if (visibilityInfo.visibleFraction > 0.5) {
                    _activeSection.value = index;
                  }
                },
                child: _sections[index],
              );
            },
          ),
          Header(
            onMenuItemTap: _scrollToSection,
            activeSection: _activeSection,
          ),
        ],
      ),
    );
  }
}
