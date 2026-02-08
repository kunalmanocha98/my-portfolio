import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class BackgroundAnimationWidget extends StatefulWidget {
  const BackgroundAnimationWidget({super.key});

  @override
  State<BackgroundAnimationWidget> createState() =>
      _BackgroundAnimationWidgetState();
}

class _BackgroundAnimationWidgetState extends State<BackgroundAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            // Orb 1
            Align(
              alignment: Alignment(
                sin(2 * pi * _controller.value + 1),
                cos(2 * pi * _controller.value + 0.5),
              ),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: isDark
                        ? [
                            Colors.purple.withOpacity(0.6),
                            Colors.transparent,
                          ]
                        : [
                            Colors.blue.withOpacity(0.4),
                            Colors.transparent,
                          ],
                  ),
                ),
              ),
            ),
            // Orb 2
            Align(
              alignment: Alignment(
                sin(2 * pi * _controller.value * 1.5 + 2),
                cos(2 * pi * _controller.value * 0.7 + 1.5),
              ),
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: isDark
                        ? [
                            Colors.blueAccent.withOpacity(0.6),
                            Colors.transparent,
                          ]
                        : [
                            Colors.orange.withOpacity(0.4),
                            Colors.transparent,
                          ],
                  ),
                ),
              ),
            ),
            // Orb 3
            Align(
              alignment: Alignment(
                sin(2 * pi * _controller.value * 0.8 + 3),
                cos(2 * pi * _controller.value * 1.2 + 2.5),
              ),
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: isDark
                        ? [
                            Colors.teal.withOpacity(0.6),
                            Colors.transparent,
                          ]
                        : [
                            Colors.pink.withOpacity(0.4),
                            Colors.transparent,
                          ],
                  ),
                ),
              ),
            ),
            // Glass effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ],
        );
      },
    );
  }
}
