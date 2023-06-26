import 'package:flutter/material.dart';

/// Contains the TrackPad Widget source
/// Returns itself as a Widget to be used recursively
class TrackPad extends StatefulWidget {
  const TrackPad({Key? key}) : super(key: key);

  /// From Stateful Widget -> Initalizes a state for the trackpad
  @override
  _TrackPadState createState() => _TrackPadState();
}

/// Creates Coordinate base values
/// Later getting casted to Int, after clamp
class _TrackPadState extends State<TrackPad> {
  double _xPosition = 0.0;
  double _yPosition = 0.0;
  double maxRange = 150.0;

  @override
  Widget build(BuildContext context) {
    /// Wraps class with horizontal padding
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        /// Constructs GestureDetector to track user movements
        /// Returns corespondant to the current app/window ViewPort width and height respectively
        child: GestureDetector(
          onPanStart: (details) {
            _updatePosition(details.localPosition);
          },
          onPanUpdate: (details) {
            _updatePosition(details.localPosition);
          },
          // debug/dev values
          child: Container(
            height: 500,
            color: const Color(0xFF1C1C1E),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'X Position: $_xPosition',
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text(
                    'Y Position: $_yPosition',
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// The following function updates the GestureDetector values, once change is detected
  /// Doesn't return anything
  void _updatePosition(Offset position) {
    setState(() {
      double dx = position.dx - (context.size!.width / 2);
      double dy = -position.dy + (context.size!.height / 2);

      _xPosition = (_clampPosition(dx, maxRange)).toInt() as double;
      _yPosition = (_clampPosition(dy, maxRange)).toInt() as double;
    });
  }

  /// The following function clamps GestureDetector values to fit in the arm's coordinate range (0-150)
  /// Returns updated values
  double _clampPosition(double value, double maxRange) {
    if (value.abs() > maxRange) {
      return value.isNegative ? -maxRange : maxRange;
    } else {
      return value;
    }
  }
}