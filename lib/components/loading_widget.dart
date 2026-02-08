import 'package:flutter/material.dart';
import 'package:portfolio/utils/text_styles.dart';
import 'package:portfolio/utils/strings.dart';

class LoadingWidget extends StatefulWidget {
  final bool isMobile;
  const LoadingWidget({super.key, required this.isMobile});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this)
      ..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.2, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Text(
            AppStrings.appName,
            style: widget.isMobile
                ? TextStylesMobile.nameStyle(context)
                : TextStyles.nameStyle(context),
          ),
        ),
      ),
    );
  }
}
