import 'package:flutter/material.dart';
import '../theme/color_manager.dart';
import '../constants/styles.dart';  

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
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
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
    final colors = ColorManager();
    final double calculatedWidth = MediaQuery.of(context).size.width * widget.widthFactor;

    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
      borderSide: BorderSide.none,
    );

    return SizedBox(
      width: calculatedWidth,
        child: TextField(
          controller: _internalController,
          obscureText: widget.obscureText,
          style: AppTextStyles.inputText.copyWith(color: colors.subTextColor),
          cursorColor: colors.primaryTextColor,
          decoration: InputDecoration(
            filled: true,
            fillColor: colors.textInputColor,
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            labelText: widget.labelText,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
            floatingLabelStyle: TextStyle(color: colors.subTextColor,),
            suffixIcon: _internalController.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _internalController.clear();
                    },
                    color: colors.subTextColor,
                  )
                : null,
          ),
      ),
    );
  }
}
