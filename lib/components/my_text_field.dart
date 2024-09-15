import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key, required this.text, this.maxLines, this.onChanged});

  final String text;
  final int? maxLines;
  final void Function(String v)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: maxLines == 1 ? 0 : 12,
      ),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
