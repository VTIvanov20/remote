import 'package:flutter/material.dart';

class ZButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;
  final double left;
  final double? top;
  final double? bottom;

  const ZButton({super.key, 
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
      child: Center(
        child: IconButton(
          color: Colors.greenAccent,
          highlightColor: Colors.amberAccent,
          icon: Icon(icon),
          tooltip: tooltip,
          onPressed: onPressed,
        ),
      ),
    );
  }
}

