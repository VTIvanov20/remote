import 'package:flutter/material.dart';

class ZButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;
  final double left;
  final double? top;
  final double? bottom;

  const ZButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    required this.left,
    this.top,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      child: IconButton(
        color: Colors.greenAccent,
        icon: Icon(icon),
        tooltip: tooltip,
        onPressed: onPressed,
      ),
    );
  }
}
