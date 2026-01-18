

import 'package:flutter/material.dart';

class UpdateTextField extends StatelessWidget {
  // final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final int maxLines;
  final ValueChanged ?onchanged;

  const UpdateTextField({
    super.key,
    // required this.controller,
    required this.hintText,
    this.icon,
    this.keyboardType,
    this.maxLines = 1,
    this.onchanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onchanged,
        // controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: icon != null ? Icon(icon) : null,
          filled: true,
          fillColor: Colors.grey.shade300,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
