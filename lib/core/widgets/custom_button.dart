import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key, 
    required this.text,
    required this.onPressed,
    required this.widthFactor,
  });

  final String text;
  final VoidCallback? onPressed;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * widthFactor,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          foregroundColor: Colors.black,
          backgroundColor: const Color(0xFFDBE8F2),
        ),
        child: Text(text),
      ),
    );
  }
}
