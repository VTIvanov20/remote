import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        color: Colors.deepPurple[200],
      ),
    );
  }
}
