import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    Key? key,
    required this.animController,
    required this.position,
    required this.currentIndex,
    required this.barColor,
    required this.borderBarColor

  }) : super(key: key);

  final AnimationController animController;
  final int position;
  final int currentIndex;
  final Color barColor;
  final Color borderBarColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                _buildContainer(
                  double.infinity,
                  position < currentIndex ? barColor : borderBarColor,
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animController,
                        builder: (context, child) {
                          return _buildContainer(
                            constraints.maxWidth * animController.value,
                            barColor,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) => Container(
        height: 6.0,
        width: width,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderBarColor,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      );
}
