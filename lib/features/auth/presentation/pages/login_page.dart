import 'package:flutter/material.dart';
import '../../../../core/widgets/textField.dart';
import '../../../../core/widgets/CustomButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: MediaQuery.of(context).size.width * 0.05,
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

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Hoş Geldiniz!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),

                  const SizedBox(height: 20),
                  ObscuredTextFieldSample(
                    labelText: 'E-posta',
                    widthFactor: 0.9,
                    obscureText: false,
                  ),

                  const SizedBox(height: 20),
                  ObscuredTextFieldSample(
                    labelText: 'Şifre',
                    widthFactor: 0.9,
                    obscureText: true,
                  ),

                  const SizedBox(height: 20),
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Text(
                      'Şifremi Unuttum',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 119, 125, 133)),
                    ),
                  ),

                  const SizedBox(height: 20),
                  CustomTextButton(
                    text: 'Giriş Yap',
                    onPressed: () {},
                    widthFactor: 0.9,
                  ),
                
                ],
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 0,
              right: 0,
              child: Text(
                'Hesabın yok mu? Kayıt Ol',
                 textAlign: TextAlign.center,
                 style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 119, 125, 133)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}