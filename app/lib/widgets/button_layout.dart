import 'package:flutter/material.dart';
import 'package:movie_app/widgets/components/buttons_landscape.dart';
import 'package:movie_app/widgets/components/buttons_portrait.dart';

class ButtonLayout extends StatelessWidget {
  const ButtonLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const PortaitButtons();
        } else {
          return const LandscapeButtons();
        }
      },
    );
  }
}