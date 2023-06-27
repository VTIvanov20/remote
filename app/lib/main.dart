import 'package:flutter/material.dart';
import 'package:movie_app/track_pad.dart';
import 'package:movie_app/options.dart';
import 'package:movie_app/button_layout.dart';
import 'colors.dart';

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

class AppContents extends StatelessWidget {
  const AppContents({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 60),
          child: Text(
            "Choose a robot",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 17.5,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),
        OptionBar(),
        SizedBox(height: 20),
        TrackPad(),
        SizedBox(height: 20),
        ButtonLayout(),
      ],
    );
  }
}