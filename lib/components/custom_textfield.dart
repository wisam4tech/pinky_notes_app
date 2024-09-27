import 'package:flutter/material.dart';
import 'package:notes_app/components/constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
  });
  final String hintText;
  final int maxLines;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is required';
          } else {
            return null;
          }
        },
        onSaved: onSaved,
        onChanged: onChanged,
        maxLines: maxLines,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: kPrimaryColor),
          errorBorder: borderBiulder(Colors.red),
          enabledBorder: borderBiulder(),
          focusedBorder: borderBiulder(kPrimaryColor),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          hintText: hintText,
        ),
      ),
    );
  }

  OutlineInputBorder borderBiulder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.white, width: 1),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
