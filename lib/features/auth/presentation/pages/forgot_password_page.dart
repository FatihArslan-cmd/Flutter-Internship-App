import 'package:flutter/material.dart';
import 'package:testapp/core/constants/paddings.dart';
import 'package:testapp/core/theme/color_manager.dart';
import 'package:testapp/core/utils/text_style_extensions.dart';
import 'package:testapp/core/constants/text_constants.dart'; 
import '../../../../core/widgets/text_field.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/constants/styles.dart';

class ForgotpasswordPage extends StatelessWidget {
  ForgotpasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColorConstant.instance.backgroundColor,
      appBar: AppBar(
        title: Text(
          TextConstants.forgotPasswordTitle, 
          style: AppTextStyles.appBarText.withColor(
            CustomColorConstant.instance.primaryTextColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
        padding: AppPaddings.pagePadding,
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                labelText: TextConstants.email,
                widthFactor: 0.9,
                obscureText: false,
              ),
              CustomTextField(
                labelText: TextConstants.phoneNumber, 
                widthFactor: 0.9,
                obscureText: false,
              ),
              CustomTextButton(
                text: TextConstants.sendCode, 
                onPressed: () {},
                widthFactor: 0.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
