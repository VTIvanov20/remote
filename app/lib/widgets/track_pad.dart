import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class TrackPad extends StatefulWidget {
  final Function(double, double, double) onPositionSelected;
  const TrackPad({ required this.onPositionSelected});

  @override
  _TrackPadState createState() => _TrackPadState();
}

class _TrackPadState extends State<TrackPad> {
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

              var finalXPosition =
                  (xScaleFactor * _xPosition + (finalXMin - xScaleFactor * xMin)).roundToDouble();
              var finalYPosition =
                  (yScaleFactor * _yPosition + (finalYMin - yScaleFactor * yMin)).roundToDouble();

              var posList = [finalXPosition, finalYPosition];
              print(posList);

              updateGestureData(finalXPosition, finalYPosition);
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

  void updateGestureData(double xPosition, double yPosition) async {
    Map<String, dynamic> gestureData = {
      'gestureType': 'trackpad',
      'xPosition': xPosition,
      'yPosition': yPosition,
    };

    String jsonData = jsonEncode(gestureData);

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    String filePath = '$tempPath/gesture_data.json';

    File file = File(filePath);
    await file.writeAsString(jsonData);

    // Read the JSON file
    String fileContent = await file.readAsString();
    Map<String, dynamic> storedGestureData = jsonDecode(fileContent);

    // Perform any further processing with the gesture data
    print(storedGestureData);
  }
}
