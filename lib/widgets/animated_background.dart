import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('color1', ColorTween(begin: Colors.indigo, end: Colors.blue),
          duration: const Duration(seconds: 3))
      ..tween('color2', ColorTween(begin: Colors.blue, end: Colors.purple),
          duration: const Duration(seconds: 3));

    return MirrorAnimationBuilder<Movie>(
      tween: tween,
      duration: tween.duration,
      builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                value.get('color1'),
                value.get('color2'),
              ],
            ),
          ),
        );
      },
    );
  }
}

