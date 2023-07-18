import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/views/portrait.dart';
import 'package:movie_app/views/landscape.dart';
import 'widgets/colors.dart';
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
  ]).then((value) => runApp(const ArmController()));
}

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
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return const PortraitView();
    } else {
      return const LandscapeView();
    }
  }
}
