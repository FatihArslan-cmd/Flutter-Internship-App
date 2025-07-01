import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.widthFactor,
  }) : super(key: key);

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
            borderRadius: BorderRadius.circular(10.0),
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