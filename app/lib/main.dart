import 'package:flutter/material.dart';
import 'package:movie_app/square.dart';
import 'package:movie_app/track_pad.dart';
import 'package:movie_app/options.dart';
import 'package:movie_app/bottom_nav_widget.dart';

void main() => runApp(const ArmController());

class ArmController extends StatelessWidget {
  const ArmController({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Your App',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: AppContents(),
      ),
    );
  }
}

class AppContents extends StatelessWidget {
  const AppContents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 60),
            child: Text(
              "Choose a robot",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 17.5,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        OptionBar(),
        TrackPad(),
      ],
    );
  }
}
