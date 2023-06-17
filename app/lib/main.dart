import 'package:flutter/material.dart';
import 'package:movie_app/square.dart';
import 'package:movie_app/bottom_nav_widget.dart';

/*
Propagation Tool: Create a tool that provides real-time propagation forecasts and conditions for various frequency bands. Users can input their location and desired band, and the app can display current propagation conditions, solar activity, and other relevant data to optimize their radio communications.
*/

void main() => runApp(const ArmController());

class ArmController extends StatelessWidget {
  const ArmController({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      home: ListView(
        children: [
          MySquare(),
          MySquare(),
          const BottomNavigationWidget(),
        ],
      ),
    );
  }
}
