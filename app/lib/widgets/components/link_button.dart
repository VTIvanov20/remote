import 'package:flutter/material.dart';
import 'package:movie_app/widgets/colors.dart';

class LinkIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const LinkIcon({
    required this.icon,
    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
      return  Expanded(
      child: IconButton(
        icon: Icon(icon),
        color: AppColors.icons,
        onPressed: onPressed,
      ),
    );
  }
}
