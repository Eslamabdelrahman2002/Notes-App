import 'package:flutter/material.dart';

class MyBottom extends StatelessWidget {
  const MyBottom({super.key, required this.text, this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16), // Added padding for button
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade700,
          // Background color of the button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(16), // Padding inside the button
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16, // Adjust font size if needed
          ),
        ),
      ),
    );
  }
}
