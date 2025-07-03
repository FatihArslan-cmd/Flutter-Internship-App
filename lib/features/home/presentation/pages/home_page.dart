import 'package:flutter/material.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/constants/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        title: const Text('Kullanıcılar', style: AppTextStyles.appBarText),
        centerTitle: true,
        backgroundColor: CustomColorConstant.instance.backgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: CustomColorConstant.instance.primaryTextColor,
          ),
          onPressed: () {
            Fluttertoast.showToast(
              msg: "Hesaptan çıkış yapıldı",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.green[600],
              textColor: Colors.white,
              fontSize: 16.0,
            );
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(user['name']!, style: AppTextStyles.buttonText),
                subtitle: Text(
                  user['email']!,
                  style: AppTextStyles.subText.copyWith(
                    color: CustomColorConstant.instance.subTextColor,
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
