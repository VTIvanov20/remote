import 'package:flutter/material.dart';
import 'package:movie_app/widgets/colors.dart';

class ZParent extends StatelessWidget {
  const ZParent({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}
