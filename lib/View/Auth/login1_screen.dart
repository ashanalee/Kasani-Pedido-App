import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kasani_fish/Controller/password_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_filelds.dart';
import 'login2_screen.dart';

class Login1Screen extends StatelessWidget {
  Login1Screen({super.key, required this.title});

  final String title;
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PasswordController(),
      child: Scaffold(
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
              const SizedBox(height: 15),
              const Text(
                'Cambia tu contrasena',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.blueLagoon,
                ),
              ),
              const SizedBox(height: 5),
              CustomPasswordField(controller: passwordController, hintText: 'Contrasena', height: 47, width: 296,),
              const SizedBox(height: 15),
              CustomPasswordField(controller: passwordController, hintText: 'Repetir Contrasena', height: 47, width: 296,),
              const SizedBox(height: 130),
              CustomButton(
                text: 'Siguiente',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login2Screen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Volver',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueLagoon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
