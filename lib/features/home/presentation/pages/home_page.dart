import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/constants/paddings.dart';
import 'package:testapp/core/utils/text_style_extensions.dart';
import '../../../auth/data/auth_cubit.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/constants/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testapp/core/constants/text_constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> users = List.generate(
    10,
    (index) => {
      'name': 'Kullanıcı ${index + 1} ',
      'email': 'user${index + 1}@example.com',
      'image': 'assets/images/i${index + 1}.png',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorConstant.instance.backgroundColor,
      appBar: AppBar(
        title: Text(
          TextConstants.usersTitle,
          style: AppTextStyles.appBarText
            ..withColor(CustomColorConstant.instance.primaryTextColor),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: CustomColorConstant.instance.primaryTextColor,
          ),
          onPressed: () {
            context.read<AuthCubit>().logout();
            Fluttertoast.showToast(
              msg: TextConstants.logoutSuccess,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: CustomColorConstant.instance.toastSuccesMessage,
              textColor: CustomColorConstant.instance.toastTextColor,
            );
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
        ),
      ),

      body: SafeArea(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Padding(
              padding: AppPaddings.homePagePadding,
              child: ListTile(
                title: Text(user['name']!, style: AppTextStyles.buttonText),
                subtitle: Text(
                  user['email']!,
                  style: AppTextStyles.subText.withColor(
                    CustomColorConstant.instance.primaryTextColor,
                  ),
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(user['image']!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
