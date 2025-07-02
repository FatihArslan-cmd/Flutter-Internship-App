import 'package:flutter/material.dart';
import '../../../../core/widgets/text_field.dart';
import '../../../../core/widgets/custom_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Kayıt Ol', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Adınız',
                    widthFactor: 0.9,
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Soyadınız',
                    widthFactor: 0.9,
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
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
                  CustomTextField(
                    labelText: 'Şifre',
                    widthFactor: 0.9,
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  CustomTextButton(
                    text: 'Kayıt Ol',
                    onPressed: () {
                    },
                    widthFactor: 0.9,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                 color: Colors.white,
                 child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text(
                      'Zaten hesabın var mı?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 119, 125, 133),
                      ),
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