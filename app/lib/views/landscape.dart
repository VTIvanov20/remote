import 'package:flutter/material.dart';
import 'package:movie_app/widgets/track_pad.dart';
import 'package:movie_app/widgets/options.dart';
import 'package:movie_app/widgets/button_layout.dart';
import 'dart:io';
import 'package:movie_app/widgets/colors.dart';

class LandscapeView extends StatefulWidget {
  const LandscapeView({Key? key});

  @override
  _LandscapeViewState createState() => _LandscapeViewState();
}

class _LandscapeViewState extends State<LandscapeView> {
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

  return ListView(
      children: [
        const Text(
            "Welcome",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 17.5,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
            textAlign: TextAlign.center,
          ),
        const OptionBar(),
        GestureDetector(
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
        ),
        const ButtonLayout(),
      ],
    );
  }
}