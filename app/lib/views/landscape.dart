import 'package:flutter/material.dart';
import 'package:movie_app/widgets/track_pad_wrapper.dart';
import 'package:movie_app/widgets/button_layout.dart';
import 'package:movie_app/widgets/popup.dart';
import 'dart:io';

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
        Align(
          alignment: Alignment.topRight,
          child: CustomPopupMenuButton(
              onItemSelected: (String selectedItem) {
                // Handle the selected item here
                print('Selected item: $selectedItem');
              },
            ),
        ),
        // const OptionBar(),
        Row(
          children: [
            const Expanded(child: ButtonLayout()),
            Expanded(child: TrackPadWrapper()),
          ],
        ),
      ],
    );
  }
}