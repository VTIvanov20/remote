import 'package:flutter/material.dart';
import 'package:movie_app/widgets/colors.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
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
    );
  }
}
