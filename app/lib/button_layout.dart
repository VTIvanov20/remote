import 'package:flutter/material.dart';

class ButtonLayout extends StatelessWidget {
  const ButtonLayout({super.key});

  @override
  Widget build(BuildContext context) {
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
                    width: 60,
                    height: 60,
                    color: const Color(0xFF1C1C1E),
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
                    width: 60,
                    height: 60,
                    color: const Color(0xFF1C1C1E),
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
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => print("tapped 3"),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: const Color(0xFF1C1C1E),
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
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    width: 60,
                    height: 140,
                    color: const Color(0xFF0E0E10),
                    child: const Center(
                      child: Text(
                        '4',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
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
