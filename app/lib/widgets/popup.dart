import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final Function(String) onItemSelected;

  CustomPopupMenuButton({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white, // Set the color of the icon to white
      ),
      onSelected: (String result) {
        onItemSelected(result);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'item1',
          child: Text('Item 1'),
        ),
        const PopupMenuItem<String>(
          value: 'item2',
          child: Text('Item 2'),
        ),
        const PopupMenuItem<String>(
          value: 'item3',
          child: Text('Item 3'),
        ),
      ],
    );
  }
}
