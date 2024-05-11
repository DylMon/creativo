import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> animation1;
  late Animation<Color?> animation2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    animation1 = ColorTween(
      begin: Colors.red,
      end: Colors.deepPurpleAccent,
    ).animate(controller);

    animation2 = ColorTween(
      begin: Colors.yellow,
      end: Colors.redAccent,
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [animation1.value ?? Colors.blue, animation2.value ?? Colors.red],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
