import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../widgets/about_section.dart';
import '../widgets/animated_background.dart';
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
          const AnimatedBackground(),
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

//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../main.dart';
// import '../widgets/animated_background.dart';
// import '../widgets/hero_section.dart';
// import '../widgets/about_section.dart';
// import '../widgets/skills_section.dart';
// import '../widgets/projects_section.dart';
// import '../widgets/experience_section.dart';
// import '../widgets/education_section.dart';
// import '../widgets/contact_section.dart';
// import '../widgets/footer.dart';
//
// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   final ScrollController _scrollController = ScrollController();
//   final List<GlobalKey> _sectionKeys = List.generate(8, (_) => GlobalKey());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           const AnimatedBackground(),
//           CustomScrollView(
//             controller: _scrollController,
//             slivers: [
//               SliverAppBar(
//                 floating: true,
//                 backgroundColor: Colors.transparent,
//                 elevation: 0,
//                 actions: [
//                   IconButton(
//                     icon: Icon(ref.watch(darkModeProvider)
//                         ? Icons.light_mode
//                         : Icons.dark_mode),
//                     onPressed: () => ref.read(darkModeProvider.notifier).state =
//                         !ref.read(darkModeProvider),
//                   ),
//                 ],
//               ),
//               SliverList(
//                 delegate: SliverChildListDelegate([
//                   HeroSection(key: _sectionKeys[0]),
//                   AboutSection(key: _sectionKeys[1]),
//                   SkillsSection(key: _sectionKeys[2]),
//                   ExperienceSection(key: _sectionKeys[3]),
//                   ProjectsSection(key: _sectionKeys[4]),
//                   EducationSection(key: _sectionKeys[5]),
//                   ContactSection(key: _sectionKeys[6]),
//                   Footer(key: _sectionKeys[7]),
//                 ]),
//               ),
//             ],
//           ),
//           Positioned(
//             right: 16,
//             top: 0,
//             bottom: 0,
//             child: Center(
//               child: NavigationDots(
//                 itemCount: _sectionKeys.length,
//                 onDotPressed: (index) {
//                   Scrollable.ensureVisible(
//                     _sectionKeys[index].currentContext!,
//                     duration: const Duration(milliseconds: 600),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class NavigationDots extends StatelessWidget {
//   final int itemCount;
//   final Function(int) onDotPressed;
//
//   const NavigationDots({
//     Key? key,
//     required this.itemCount,
//     required this.onDotPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: List.generate(
//         itemCount,
//         (index) => GestureDetector(
//           onTap: () => onDotPressed(index),
//           child: Container(
//             width: 12,
//             height: 12,
//             margin: const EdgeInsets.symmetric(vertical: 4),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
