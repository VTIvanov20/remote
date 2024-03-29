import 'package:flutter/material.dart';
import 'package:movie_app/widgets/z_pos_provider.dart';
import '../colors.dart';

class TrackPad extends StatefulWidget {
  final Function(int, int) onCoordinatesUpdated;
  const TrackPad({super.key,  required this.onCoordinatesUpdated});

  @override
  _TrackPadState createState() => _TrackPadState();
}

class _TrackPadState extends State<TrackPad> {
  ZPositionManager zPositionManager = ZPositionManager();
  void _logCoordinates() {
    var xMin = -100;
    var xMax = 100;
    var finalXMin = 120;
    var finalXMax = 340;

    var yMin = -100;
    var yMax = 100;
    var finalYMin = -280;
    var finalYMax = 280;

    var xScaleFactor = (finalXMax - finalXMin) / (xMax - xMin);
    var yScaleFactor = (finalYMax - finalYMin) / (yMax - yMin);

    var finalXPosition = (xScaleFactor * _xPosition + (finalXMin - xScaleFactor * xMin)).round();
    var finalYPosition = (yScaleFactor * _yPosition + (finalYMin - yScaleFactor * yMin)).round();
    widget.onCoordinatesUpdated(finalXPosition, finalYPosition);

    print('Logging current coordinates:');
    print('Final X Position: $finalXPosition');
    print('Final Y Position: $finalYPosition');
  }

  double _xPosition = 0.0;
  double _yPosition = 0.0;
  double maxRange = 100.0;

  @override
  Widget build(BuildContext context) {
    final availableWidth = MediaQuery.of(context).size.width - 40;
    final availableHeight = MediaQuery.of(context).size.height / 1.75;

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

              _xPosition = _clampPosition(dx, maxRange).roundToDouble();
              _yPosition = _clampPosition(dy, maxRange).roundToDouble();
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
                  Text(
                    'Z Position: ${zPositionManager.zPosition}',
                    style: const TextStyle(fontSize: 24, color: AppColors.text),
                  ),
                  ElevatedButton(
                    onPressed: _logCoordinates, // Call the function to log coordinates
                    child: Text('Log Coordinates'),
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
