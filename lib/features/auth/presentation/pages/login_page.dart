import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/theme/color_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testapp/core/utils/text_style_extensions.dart';
import 'package:testapp/core/constants/text_constants.dart';
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
        msg: TextConstants.fillAllFields,
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
              msg: TextConstants.loginSuccess,
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
                              TextConstants.welcome,
                              style: AppTextStyles.welcomeText.withColor(
                                CustomColorConstant.instance.primaryTextColor,
                              ),
                            ),
                            CustomTextField(
                              labelText: TextConstants.email,
                              widthFactor: 0.9,
                              obscureText: false,
                              controller: _emailController,
                            ),
                            CustomTextField(
                              labelText: TextConstants.password,
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
                                    TextConstants.forgotPassword,
                                    style: AppTextStyles.subText.withColor(
                                      CustomColorConstant.instance.subTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CustomTextButton(
                              text: TextConstants.login,
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
                            TextConstants.noAccountRegister,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.subText.withColor(
                              CustomColorConstant.instance.subTextColor,
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
