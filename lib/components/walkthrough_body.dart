import 'package:flutter/material.dart';

class WalkthroughBody extends StatelessWidget {
  const WalkthroughBody({
    Key? key,
    required this.image,
    required this.label,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle
  }) : super(key: key);

  final Widget image;
  final String label;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 50,
      ),
      child: Column(
        children: [
          image,
          const SizedBox(height: 16),
          Text(
            label,
            style: titleStyle ?? const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
