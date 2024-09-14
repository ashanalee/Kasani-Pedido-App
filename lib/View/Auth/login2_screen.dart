import 'package:flutter/material.dart';
import 'package:kasani_fish/view/widgets/custom_button.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../Home/home_screen.dart';

class Login2Screen extends StatelessWidget {
  const Login2Screen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
              child: SizedBox(
                width: 111,
                height: 174,
                child: Image.asset(Appimages.logokasani),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 38,
              width: 38,
              child: Image.asset(Appimages.checkcircle),
            ),
            const SizedBox(height: 13),
            Text('Actualizacion de\ncontrasena exitosa', style: TextStyle(color: AppColors.black, fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 130),
            CustomButton(text: 'INGRESAR', onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: ''),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

