import 'package:flutter/material.dart';
import '../theme/color_manager.dart';
import '../constants/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.widthFactor,
    this.isLoading = false, 
  });

  final String text;
  final VoidCallback? onPressed;
  final double widthFactor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * widthFactor,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
          textStyle: AppTextStyles.buttonText,
          foregroundColor: CustomColorConstant.instance.primaryTextColor,
          backgroundColor: CustomColorConstant.instance.buttonBackgroundColor,
        ),
        
        child: isLoading
            ? SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    CustomColorConstant.instance.primaryTextColor,
                  ),
                ),
              )
            : Text(text),
      ),
    );
  }
}