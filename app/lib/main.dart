import 'package:flutter/material.dart';
import 'package:movie_app/track_pad.dart';
import 'package:movie_app/options.dart';
import 'package:movie_app/button_layout.dart';
import 'colors.dart';
import 'dart:io';

void main() => runApp(const ArmController());

class ArmController extends StatelessWidget {
  const ArmController({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Your App',
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: AppContents(),
        ),
      ),
    );
  }
}

class AppContents extends StatefulWidget {
  const AppContents({Key? key});

  @override
  _AppContentsState createState() => _AppContentsState();
}

class _AppContentsState extends State<AppContents> {
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
        // const SizedBox(height: 20),
        const OptionBar(),
        // const SizedBox(height: 20),
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
        // const SizedBox(height: 20),
        const ButtonLayout(),
      ],
    );
  }
}
