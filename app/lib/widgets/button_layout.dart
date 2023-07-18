import 'package:flutter/material.dart';
import 'package:movie_app/widgets/components/z_button.dart';
import 'package:movie_app/widgets/components/z_parent.dart';
import 'package:movie_app/widgets/components/action_button.dart';
import 'package:movie_app/widgets/components/routine_button.dart';

class ButtonLayout extends StatelessWidget {
  const ButtonLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoutineButton(
                onTap: () {
                  print("clicked 1");
                }, 
                buttonText: '1'
              ),
              const SizedBox(height: 10),
              RoutineButton(
                onTap: () {
                  print("clicked 2");
                }, 
                buttonText: '2'
              ),
            ],
          ),
          const SizedBox(width: 10),
          const Flexible(
            flex: 1,
            child: Column(
              children: [
                ActionButton()
              ],
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  width: screenWidth * 0.15,
                  height: screenWidth * 0.3,
                  child: Stack(
                    children: [
                      const ZParent(),
                      ZButton(
                        icon: Icons.arrow_drop_up_outlined,
                        tooltip: "Increase Z by 1", 
                        onPressed: () {
                        },
                        top: 5,
                        left: 5,
                      ),
                      ZButton(
                        icon: Icons.arrow_drop_down_outlined,
                        tooltip: "Decrease Z by 1", 
                        onPressed: () {
                        },
                        bottom: 5,
                        left: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
