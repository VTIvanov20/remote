import 'package:flutter/material.dart';
import 'colors.dart';

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
              GestureDetector(
                onTap: () => print("tapped 1"),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    color: AppColors.inputGray,
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => print("tapped 2"),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    color: AppColors.inputGray,
                    child: const Center(
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => print("tapped 3"),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: screenWidth * 0.25,
                      height: screenWidth * 0.25,
                      color: AppColors.inputGray,
                      child: const Center(
                        child: Text(
                          '3',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          color: AppColors.inputBlack,
                          child: const Center(
                            child: Text(
                              'Z',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        // left: 10,
                        child: IconButton(
                          color: Colors.greenAccent,
                          icon: const Icon(Icons.arrow_drop_up_outlined),
                          tooltip: 'Increase Z by 1',
                          onPressed: () {
                            print("up");
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        child: IconButton(
                          color: Colors.greenAccent,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          tooltip: 'Decrease Z by 1',
                          onPressed: () {
                            print("down");
                          },
                        ),
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
