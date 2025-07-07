import 'package:flutter/material.dart';
import 'package:testapp/core/theme/color_manager.dart';
import 'package:testapp/core/utils/text_style_extensions.dart';
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
          'Şifremi Unuttum',
          style: AppTextStyles.appBarText.withColor(
            CustomColorConstant.instance.primaryTextColor,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                labelText: 'Email',
                widthFactor: 0.9,
                obscureText: false,
              ),
              CustomTextField(
                labelText: 'Telefon Numarası',
                widthFactor: 0.9,
                obscureText: false,
              ),
              CustomTextButton(
                text: 'Kod Gönder',
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
