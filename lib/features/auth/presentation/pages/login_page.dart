import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/theme/color_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/widgets/text_field.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/constants/styles.dart';
import '../../data/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
        msg: "Lütfen tüm alanları doldurun.",
        backgroundColor: CustomColorConstant.instance.toastErrorMessage,
        textColor: CustomColorConstant.instance.toastTextColor,
      );
      return;
    }

    context.read<AuthCubit>().login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColorConstant.instance.backgroundColor,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Fluttertoast.showToast(
              msg: "Başarıyla giriş yapıldı!",
              backgroundColor: CustomColorConstant.instance.toastSuccesMessage,
              textColor: CustomColorConstant.instance.toastTextColor,
            );
            Navigator.pushReplacementNamed(context, '/home-page');
          } else if (state is AuthFailure) {
            Fluttertoast.showToast(
              msg: state.errorMessage,
              backgroundColor: CustomColorConstant.instance.toastErrorMessage,
              textColor: CustomColorConstant.instance.toastTextColor,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return SafeArea(
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
                            Text(
                              'Hoş Geldiniz!',
                              style: AppTextStyles.welcomeText.copyWith(
                                color: CustomColorConstant
                                    .instance
                                    .primaryTextColor,
                              ),
                            ),

                            CustomTextField(
                              labelText: 'E-posta',
                              widthFactor: 0.9,
                              obscureText: false,
                              controller: _emailController,
                            ),
                            CustomTextField(
                              labelText: 'Şifre',
                              widthFactor: 0.9,
                              obscureText: true,
                              controller: _passwordController,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                              ),
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
                                      color: CustomColorConstant
                                          .instance
                                          .subTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CustomTextButton(
                              text: 'Giriş Yap',
                              onPressed: isLoading
                                  ? null
                                  : () => _handleLogin(context),
                              widthFactor: 0.9,
                              isLoading: isLoading,
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
                              color: CustomColorConstant.instance.subTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
