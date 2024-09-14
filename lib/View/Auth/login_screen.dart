import 'package:flutter/material.dart';
import 'package:kasani_fish/view/auth/login1_screen.dart';
import 'package:kasani_fish/view/widgets/custom_button.dart';
import 'package:kasani_fish/view/widgets/custom_text_filelds.dart';
import 'package:provider/provider.dart';
import '../../Controller/password_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key, required this.title});

  final String title;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => PasswordController(),
      child: Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Container(
                height: 430,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Appimages.login),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 350,
            child: Container(
              height: 350,
              width: 340,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CustomEmailField(controller: emailController),
                    const SizedBox(height: 16),
                    CustomPasswordField(controller: passwordController, hintText: 'Password', height: 47, width: 447,),
                    const SizedBox(height: 70),
                    CustomButton(text: 'INGRESAR', onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Login1Screen(title: ''),
                        ),
                      );
                    }
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                      },
                      child: const Text(
                        'Olvidaste tu contrasena\u2019?',
                        style: TextStyle(fontSize: 16, color: AppColors.blueLagoon, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}



