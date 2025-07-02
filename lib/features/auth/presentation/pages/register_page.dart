import 'package:flutter/material.dart';
import '../../../../core/widgets/text_field.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/constants/styles.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ColorManager();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colors.backgroundColor,
      appBar: AppBar(
        title: const Text('Kayıt Ol', style: AppTextStyles.appBarText),
        centerTitle: true,
        backgroundColor: colors.backgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    CustomTextField(
                      labelText: 'Adınız',
                      widthFactor: 0.9,
                      obscureText: false,
                    ),

                    CustomTextField(
                      labelText: 'Soyadınız',
                      widthFactor: 0.9,
                      obscureText: false,
                    ),

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

                    CustomTextField(
                      labelText: 'Şifre',
                      widthFactor: 0.9,
                      obscureText: true,
                    ),

                    CustomTextButton(
                      text: 'Kayıt Ol',
                      onPressed: () {},
                      widthFactor: 0.9,
                    ),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  'Zaten hesabın var mı?',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subText.copyWith(
                    color: colors.subTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
