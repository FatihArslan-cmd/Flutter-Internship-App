import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testapp/core/constants/paddings.dart';
import 'package:testapp/core/utils/text_style_extensions.dart';
import 'package:testapp/core/constants/text_constants.dart';
import '../../../../core/widgets/text_field.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/constants/styles.dart';
import '../../data/auth_cubit.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleRegister(BuildContext context) {
    if (_nameController.text.trim().isEmpty ||
        _surnameController.text.trim().isEmpty ||
        _phoneNumberController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {
      Fluttertoast.showToast(
        msg: TextConstants.fillAllFields,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: CustomColorConstant.instance.toastErrorMessage,
        textColor: CustomColorConstant.instance.toastTextColor,
      );
      return;
    }

    context.read<AuthCubit>().register(
      _nameController.text,
      _surnameController.text,
      _phoneNumberController.text,
      _emailController.text,
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColorConstant.instance.backgroundColor,
      appBar: AppBar(
        title: Text(
          TextConstants.register,
          style: AppTextStyles.appBarText.withColor(
            CustomColorConstant.instance.primaryTextColor,
          ),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, '/home-page');
          } else if (state is AuthFailure) {
            Fluttertoast.showToast(
              msg: state.errorMessage,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
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
                Expanded(
                  child: Padding(
                    padding: AppPaddings.pagePadding,
                    child: Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextField(
                          labelText: TextConstants.name,
                          widthFactor: 0.9,
                          obscureText: false,
                          controller: _nameController,
                        ),
                        CustomTextField(
                          labelText: TextConstants.surname,
                          widthFactor: 0.9,
                          obscureText: false,
                          controller: _surnameController,
                        ),
                        CustomTextField(
                          labelText: TextConstants.email,
                          widthFactor: 0.9,
                          obscureText: false,
                          controller: _emailController,
                        ),
                        CustomTextField(
                          labelText: TextConstants.phoneNumber,
                          widthFactor: 0.9,
                          obscureText: false,
                          controller: _phoneNumberController,
                        ),
                        CustomTextField(
                          labelText: TextConstants.password,
                          widthFactor: 0.9,
                          obscureText: true,
                          controller: _passwordController,
                        ),
                        CustomTextButton(
                          text: TextConstants.register,
                          onPressed: isLoading
                              ? null
                              : () => _handleRegister(context),
                          widthFactor: 0.9,
                          isLoading: isLoading,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text(
                        TextConstants.alreadyHaveAccount,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.subText.withColor(
                          CustomColorConstant.instance.subTextColor,
                        ),
                      ),
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
