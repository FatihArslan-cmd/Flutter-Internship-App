import 'package:flutter/material.dart';

class ObscuredTextFieldSample extends StatelessWidget {
  final String labelText;
  final double widthFactor;
  final double borderRadius;
  final bool obscureText;

  const ObscuredTextFieldSample({
    super.key,
    required this.labelText,
    required this.widthFactor,
    this.borderRadius = 10.0,
    this.obscureText = false,
  }) : assert(widthFactor >= 0.0 && widthFactor <= 1.0);

  @override
  Widget build(BuildContext context) {
    final double calculatedWidth = MediaQuery.of(context).size.width * widthFactor;

    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      borderSide: BorderSide.none,
    );

    return SizedBox(
      width: calculatedWidth,
      child:
          TextSelectionTheme(
            data: const TextSelectionThemeData(
              selectionColor: Color(0x33959ca6),
            ),
            child: TextField(
              obscureText: obscureText,
              style: const TextStyle(
                color: Color(0xff959ca6),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              cursorColor: Colors.black,

              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xfff2f2f5),
                border: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                labelText: labelText,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
                 floatingLabelStyle: const TextStyle(color:Color(0xff959ca6)),
              ),
            ),
          ),
    );
  }
}