import 'package:flutter/material.dart';

class OptionBar extends StatelessWidget {
  const OptionBar({super.key});

  // TODO: Make icons into buttons with links

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: const <Widget>[
          Expanded(
            child: Icon(
              Icons.bug_report_outlined,
              color: Color(0xFF404040),
            ),
          ),
          Expanded(
            child: Icon(
              Icons.bug_report_outlined,
              color: Color(0xFF404040),
            ),
          ),
          Expanded(
            child: Icon(
              Icons.bug_report_outlined,
              color: Color(0xFF404040),
            ),
          ),
        ],
      ),
    );
  }
}
