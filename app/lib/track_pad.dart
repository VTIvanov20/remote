import 'package:flutter/material.dart';

class TrackPad extends StatelessWidget {
  const TrackPad({super.key});

  // TODO: Use gestures in the track pad

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          height: 500,
          color: const Color(0xFF1C1C1E),
        ),
      ),
    );
  }
}
