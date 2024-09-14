import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kasani_fish/view/auth/wellcome_screen.dart';
import '../../utils/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Wellcome(title: ''),
        ),
      );
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Appimages.splash),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
