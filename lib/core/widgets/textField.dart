import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CustomTextField extends StatefulWidget {
  final String labelText;
  final double widthFactor;
  final double borderRadius;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.widthFactor,
    this.borderRadius = 15.0,
    this.obscureText = false,
    this.controller,
  }) : assert(widthFactor >= 0.0 && widthFactor <= 1.0);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _internalController;
  bool _isInternalController = false;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = TextEditingController();
      _isInternalController = true;
    } else {
      _internalController = widget.controller!;
      _isInternalController = false;
    }
    _internalController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _internalController.removeListener(_onTextChanged);
    if (_isInternalController) {
      _internalController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double calculatedWidth = MediaQuery.of(context).size.width * widget.widthFactor;

    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
      borderSide: BorderSide.none,
    );

    return SizedBox(
      width: calculatedWidth,
      child: TextSelectionTheme(
        data: const TextSelectionThemeData(
          selectionColor: Color(0x33959ca6),
        ),
        child: TextField(
          controller: _internalController,
          obscureText: widget.obscureText,
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
            labelText: widget.labelText,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
            floatingLabelStyle: const TextStyle(color:Color(0xff959ca6)),
            suffixIcon: _internalController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _internalController.clear();
                    },
                    color: const Color(0xff959ca6),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}