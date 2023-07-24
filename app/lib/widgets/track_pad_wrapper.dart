import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/widgets/components/track_pad.dart';

class TrackPadWrapper extends StatefulWidget {
  @override
  _TrackPadWrapperState createState() => _TrackPadWrapperState();
}

class _TrackPadWrapperState extends State<TrackPadWrapper> {
  double x = 0;
  double y = 0;

  Future<void> sendCommand(String command, double x, double y, double z) async {
    final socket = await Socket.connect('localhost', 12345);
    print('Connected to Python script.');

    final data = '$command,$x,$y,$z';
    socket.write(data);

    socket.close();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          x += details.delta.dx;
          y += details.delta.dy;
        });
      },
      child: TrackPad(
        onPositionSelected: (x, y, z) {
          sendCommand('position', x, y, z);
        },
      ),
    );
  }
}
