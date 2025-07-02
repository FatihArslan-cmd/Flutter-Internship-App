import 'package:flutter/material.dart';
import '../../../../core/widgets/text_field.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/constants/styles.dart';

class ForgotpasswordPage extends StatelessWidget {
  const ForgotpasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ColorManager();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colors.backgroundColor,
      appBar: AppBar(
        title: const Text('Şifremi Unuttum', style: AppTextStyles.appBarText),
        centerTitle: true,
        backgroundColor: colors.backgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                labelText: 'Email',
                widthFactor: 0.9,
                obscureText: false,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: 'Telefon Numarası',
                widthFactor: 0.9,
                obscureText: false,
              ),
              const SizedBox(height: 20),
              CustomTextButton(
                text: 'Kod Gönder',
                onPressed: () {
                },
                widthFactor: 0.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
