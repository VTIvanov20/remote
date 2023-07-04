import 'dart:io';

import 'package:flutter/material.dart';
import 'colors.dart';

class TrackPad extends StatefulWidget {
  final Function(double, double, double) onPositionSelected;
  const TrackPad({super.key, required this.onPositionSelected});

  @override
  _TrackPadState createState() => _TrackPadState();

  void _handlePanUpdate(DragUpdateDetails details) {
    final x = details.delta.dx;
    final y = details.delta.dy;
    const z = 0.0;

    sendCoordinates(x, y, z);

    onPositionSelected(x, y, z);
  }

  Future<void> sendCoordinates(double x, double y, double z) async {
    final socket = await Socket.connect('localhost', 12345);
    print('Connected to Python script.');

    final data = 'position,$x,$y,$z';
    socket.write(data);

    socket.close();
  }
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
            setState(() {
              double dx = details.localPosition.dx - (availableWidth / 2);
              double dy = -details.localPosition.dy + (availableHeight / 2);

              _xPosition = _clampPosition(dx, maxRange);
              _yPosition = _clampPosition(dy, maxRange);
            });
          },
          onPanUpdate: (details) {
            setState(() {
              double dx = details.localPosition.dx - (availableWidth / 2);
              double dy = -details.localPosition.dy + (availableHeight / 2);

              _xPosition = _clampPosition(dx, maxRange);
              _yPosition = _clampPosition(dy, maxRange);
            });
          },
          child: Container(
            height: availableHeight,
            color: AppColors.inputGray,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'X Position: $_xPosition',
                    style: const TextStyle(fontSize: 24, color: AppColors.text),
                  ),
                  Text(
                    'Y Position: $_yPosition',
                    style: const TextStyle(fontSize: 24, color: AppColors.text),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _clampPosition(double value, double maxRange) {
    if (value.abs() > maxRange) {
      return value.isNegative ? -maxRange : maxRange;
    } else {
      return value;
    }
  }
}
