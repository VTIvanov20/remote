import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/views/portrait.dart';
// import 'package:movie_app/views/landscape.dart';
import 'widgets/colors.dart';

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
  @override
  Widget build(BuildContext context) {
    // Orientation orientation = MediaQuery.of(context).orientation;
    // if (orientation == Orientation.portrait) {
    //   return const PortraitView();
    // } else {
    //   return const LandscapeView();
    // }
    return const PortraitView();
  }
}
