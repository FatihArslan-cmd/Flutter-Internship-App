import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; 
import '../../../../core/widgets/text_field.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/constants/styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ColorManager();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.27,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: Image.asset(
                      'assets/images/image.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      spacing: 20,
                      children: [
                        Text('Hoş Geldiniz!', style: AppTextStyles.welcomeText),
                        CustomTextField(
                          labelText: 'E-posta',
                          widthFactor: 0.9,
                          obscureText: false,
                        ),
                        CustomTextField(
                          labelText: 'Şifre',
                          widthFactor: 0.9,
                          obscureText: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/forgot-password',
                                );
                              },
                              child: Text(
                                'Şifremi Unuttum',
                                style: AppTextStyles.subText.copyWith(
                                  color: colors.subTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomTextButton(
                          text: 'Giriş Yap',
                          onPressed: () {
                            Fluttertoast.showToast(
                              msg: "Başarıyla giriş yapıldı!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              backgroundColor: Colors.green[600],
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );

                            Navigator.pushNamed(context, '/home-page');
                          },
                          widthFactor: 0.9,
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        'Hesabın yok mu? Kayıt Ol',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.subText.copyWith(
                          color: colors.subTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
