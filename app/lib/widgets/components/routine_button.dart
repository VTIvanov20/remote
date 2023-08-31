import 'package:flutter/material.dart';
import 'package:movie_app/widgets/colors.dart';

class RoutineButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;

  const RoutineButton({
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          width: screenWidth * 0.15,
          height: screenWidth * 0.15,
          color: AppColors.inputGray,
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
