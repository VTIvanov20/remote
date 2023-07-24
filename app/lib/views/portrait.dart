import 'package:flutter/material.dart';
import 'package:movie_app/widgets/track_pad_wrapper.dart';
// import 'package:movie_app/widgets/options.dart';
import 'package:movie_app/widgets/input.dart';
import 'package:movie_app/widgets/button_layout.dart';
import 'package:movie_app/widgets/colors.dart';
import 'dart:io';

class PortraitView extends StatefulWidget {
  const PortraitView({Key? key});

  @override
  _PortraitViewState createState() => _PortraitViewState();
}

class _PortraitViewState extends State<PortraitView> {
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
      physics: const NeverScrollableScrollPhysics(),
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
        // const OptionBar(),
        const InputField(),
        TrackPadWrapper(),
        const ButtonLayout(),
      ],
    );
  }
}