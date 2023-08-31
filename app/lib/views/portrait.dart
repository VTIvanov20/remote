import 'package:flutter/material.dart';
import 'package:movie_app/widgets/components/track_pad.dart';
import 'package:movie_app/widgets/z_pos_provider.dart';
import 'package:movie_app/widgets/button_layout.dart';
import 'package:movie_app/widgets/colors.dart';
import 'dart:convert';
import 'dart:io';

const HOST = "10.130.3.228";
const PORT = 65431;

class PortraitView extends StatefulWidget {
  const PortraitView({Key? key});

  @override
  _PortraitViewState createState() => _PortraitViewState();
}

class _PortraitViewState extends State<PortraitView> {
  ZPositionManager zPositionManager = ZPositionManager();
  late int socketX;
  late int socketY;
  late int socketZ;

  void updateCoordinates(int newSocketX, int newSocketY) {
    print('Received coordinates: X=$newSocketX, Y=$newSocketY');
    setState(() {
      socketX = newSocketX;
      socketY = newSocketY;
    });
  }

  Socket? socket;
  TextEditingController textController = TextEditingController();
  String receivedData = "";

  @override
  void initState() {
    super.initState();
    socketX = 0;
    socketY = 0;
    _connectToServer();
  }

  void _connectToServer() async {
    try {
      socket = await Socket.connect(HOST, PORT);
      print('Connected to: ${socket!.remoteAddress.address}:${socket!.remotePort}');

      socket!.listen(
        (data) {
          receivedData += utf8.decode(data);
          if (receivedData.endsWith("\n")) {
            print(receivedData.trim());
            receivedData = "";
          }
        },
        onDone: () {
          socket!.destroy();
        },
      );
    } catch (e) {
      print('Error connecting to server: $e');
    }
  }

  void _sendData(String data) {
    if (socket != null && socket!.port != 0 && data.isNotEmpty) {
      socket!.write(data);
      socket!.writeln(""); // Sending an empty line to indicate the end of the message
    }
  }

  String concatStringWithNumbers(int num1, int num2, int num3) {
    return "set_$num1,$num2,$num3";
  }

  late int _number1;
  late int _number2;
  late int _number3;

  @override
  void dispose() {
    if (socket != null) {
      socket!.destroy();
    }
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ElevatedButton(
            onPressed: () {
              print(socketX);
              Text('Current zPosition: ${zPositionManager.zPosition}');
              // zPositionManager.increaseZPosition();
              _number1 = socketX;
              _number2 = socketY;
              _number3 = zPositionManager.zPosition;
              String result = concatStringWithNumbers(_number1, _number2, _number3);
              _sendData(result);
            },
            child: const Text('Send Values'),
          ),
          Row(
            children: [
              Text(
                receivedData,
                style: const TextStyle(color: Colors.green),
              ),
            ],
          ),
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
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                socketX += details.delta.dx as int;
                socketY += details.delta.dy as int;
              });
            },
            child: TrackPad(
              onCoordinatesUpdated: updateCoordinates, // Pass the function as the callback
            ),
          ),
          const ButtonLayout(),
        ],
      ),
    );
  }
}
