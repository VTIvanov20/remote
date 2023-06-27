import 'package:flutter/material.dart';

class TrackPad extends StatefulWidget {
  const TrackPad({Key? key}) : super(key: key);

  @override
  _TrackPadState createState() => _TrackPadState();
}

class _TrackPadState extends State<TrackPad> {
  double _xPosition = 0.0;
  double _yPosition = 0.0;
  double maxRange = 150.0;

  @override
  Widget build(BuildContext context) {
    final availableWidth = MediaQuery.of(context).size.width - 40;
    final availableHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: GestureDetector(
          onPanStart: (details) {
            _updatePosition(details.localPosition, availableWidth, availableHeight);
          },
          onPanUpdate: (details) {
            _updatePosition(details.localPosition, availableWidth, availableHeight);
          },
          child: Container(
            height: availableHeight,
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

  void _updatePosition(Offset position, double availableWidth, double availableHeight) {
    setState(() {
      double dx = position.dx - (availableWidth / 2);
      double dy = -position.dy + (availableHeight / 2);

      _xPosition = _clampPosition(dx, maxRange);
      _yPosition = _clampPosition(dy, maxRange);
    });
  }

  double _clampPosition(double value, double maxRange) {
    if (value.abs() > maxRange) {
      return value.isNegative ? -maxRange : maxRange;
    } else {
      return value;
    }
  }
}