import 'package:flutter/material.dart';
import 'package:notes_app/components/constants.dart';

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget({super.key, required this.icon, this.onPressed});
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            color: kPrimaryColor,
            icon,
            size: 28,
          ),
        ),
      ),
    );
  }
}
