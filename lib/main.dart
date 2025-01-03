// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:portfolio/screens/home_screen.dart';
// import 'package:portfolio/screens/splash_screen.dart';
// import 'package:portfolio/theme/app_theme.dart';
//
// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }
//
// class MyApp extends ConsumerWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isDarkMode = ref.watch(darkModeProvider);
//
//     return MaterialApp(
//       title: 'Sudharsan S Portfolio',
//       theme: AppTheme.lightTheme.copyWith(
//         textTheme: GoogleFonts.poppinsTextTheme(AppTheme.lightTheme.textTheme),
//       ),
//       darkTheme: AppTheme.darkTheme.copyWith(
//         textTheme: GoogleFonts.poppinsTextTheme(AppTheme.darkTheme.textTheme),
//       ),
//       themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
//       debugShowCheckedModeBanner: false,
//       home: const SplashScreenWrapper(),
//     );
//   }
// }
//
// final darkModeProvider = StateProvider<bool>((ref) => false);
//
// class SplashScreenWrapper extends StatefulWidget {
//   const SplashScreenWrapper({Key? key}) : super(key: key);
//
//   @override
//   _SplashScreenWrapperState createState() => _SplashScreenWrapperState();
// }
//
// class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
//   @override
//   void initState() {
//     super.initState();
//     _navigateToHome();
//   }
//
//   _navigateToHome() async {
//     await Future.delayed(const Duration(seconds: 3));
//     Navigator.of(context).pushReplacement(
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) =>
//             const HomeScreen(),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(
//             opacity: animation,
//             child: child,
//           );
//         },
//         transitionDuration: const Duration(milliseconds: 800),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const SplashScreen();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/screens/splash_screen.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final darkModeProvider = StateProvider<bool>((ref) => false);

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sudharsan S Portfolio',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(AppTheme.lightTheme.textTheme),
      ),
      darkTheme: AppTheme.darkTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(AppTheme.darkTheme.textTheme),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const SplashScreenWrapper(),
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    var baseTheme = ThemeData(brightness: brightness);
    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: brightness,
      ).copyWith(
        secondary: Colors.purple,
      ),
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({Key? key}) : super(key: key);

  @override
  _SplashScreenWrapperState createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
