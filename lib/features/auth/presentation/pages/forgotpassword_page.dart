import 'package:flutter/material.dart';
import '../../../../core/widgets/textField.dart';
import '../../../../core/widgets/CustomButton.dart';

class ForgotpasswordPage extends StatelessWidget {
  const ForgotpasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Şifremi Unuttum',style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child:
       Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                 
                  const SizedBox(height: 25),
                  CustomTextButton(
                    text: 'Kod Gönder',
                    onPressed: () {
                    },
                    widthFactor: 0.9,
                  ),
                ],
              ),
            ),
          ],
        ),
       )
    );
  }
}