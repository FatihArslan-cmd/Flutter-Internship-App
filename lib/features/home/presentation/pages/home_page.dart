import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Welcome to the Home Page!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}