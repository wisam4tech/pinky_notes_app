import 'package:flutter/material.dart';
import 'package:notes_app/components/constants.dart';
import 'package:notes_app/components/custom_icon_widget.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget(
      {super.key, required this.text, required this.icon, this.onPressed});
  final String text;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomIconWidget(
            onPressed: onPressed,
            icon: icon,
          ),
        ],
      ),
    );
  }
}
