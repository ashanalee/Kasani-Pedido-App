import 'package:flutter/material.dart';
import 'package:kasani_fish/view/auth/login_screen.dart';
import 'package:kasani_fish/view/widgets/custom_button.dart';
import '../../utils/app_images.dart';

class Wellcome extends StatelessWidget {
  const Wellcome({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Appimages.wellcome),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          const Center(),
          Positioned(
              bottom: 90,
              left: 0,
              right: 0,
              child: Center(
                child: CustomButton(text: 'INGRESAR', onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  LoginScreen(title: ''),
                    ),
                  );
                },),
              )
          ),
        ],
      ),
    ),
  );
  }
}
