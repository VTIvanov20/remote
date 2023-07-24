import 'package:flutter/material.dart' show BuildContext, Column, CrossAxisAlignment, EdgeInsets, Flexible, Icons, Key, MainAxisAlignment, MediaQuery, Orientation, Padding, Row, SizedBox, Stack, StatelessWidget, Widget;
import 'package:movie_app/widgets/components/z_button.dart' show ZButton;
import 'package:movie_app/widgets/components/z_parent.dart' show ZParent;
import 'package:movie_app/widgets/components/action_button.dart' show ActionButton;
import 'package:movie_app/widgets/components/routine_button.dart' show RoutineButton;

class PortaitButtons extends StatelessWidget {
  const PortaitButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int zPosition = 0;

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
          if (MediaQuery.of(context).orientation == Orientation.portrait)
            const Flexible(
              flex: 1,
              child: Column(
                children: [
                  ActionButton(),
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
                          if (zPosition < 180) {
                            zPosition++;
                            print("up, current z: $zPosition");
                          } else {
                            print("Can't go higher than 180");
                          }
                        },
                        top: 5,
                        left: 5,
                      ),
                      ZButton(
                        icon: Icons.arrow_drop_down_outlined,
                        tooltip: "Decrease Z by 1", 
                        onPressed: () {
                          if (zPosition > -180) {
                            zPosition--;
                            print("down, current z: $zPosition");
                          } else {
                            print("Can't go lower than -180");
                          }
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