import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    required this.buttonColor,
    required this.textColor,
    this.isLoading = false,
  });
  final String text;
  final Color buttonColor;
  final Color textColor;
  final Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 32),
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(8),
          ),
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.black,
                  )
                : Text(
                    text,
                    style: TextStyle(fontSize: 18, color: textColor),
                  ),
          ),
        ),
      ),
    );
  }
}
