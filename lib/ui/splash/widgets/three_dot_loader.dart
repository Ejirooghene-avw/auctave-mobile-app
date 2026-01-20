import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class ThreeDotLoader extends StatefulWidget {
  const ThreeDotLoader({super.key});

  @override
  State<ThreeDotLoader> createState() => _ThreeDotLoaderState();
}

class _ThreeDotLoaderState extends State<ThreeDotLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            final value = (_controller.value + index * 0.2) % 1;
            final opacity = (value < 0.5) ? value * 2 : (1 - value) * 2;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Opacity(
                opacity: opacity,
                child: const CircleAvatar(
                  radius: 6,
                  backgroundColor: ColorName.pbaBlack,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
