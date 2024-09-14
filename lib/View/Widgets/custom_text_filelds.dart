import 'package:flutter/material.dart';
import 'package:kasani_fish/Controller/password_controller.dart';
import 'package:provider/provider.dart';
import '../../utils/app_colors.dart';

class CustomEmailField extends StatelessWidget {
  final TextEditingController controller;

  const CustomEmailField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      width: 447,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(fontSize: 16, color: AppColors.light),
          fillColor: AppColors.grey,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(fontSize: 16, color: AppColors.light),
      ),
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final double height;
  final double width;

  const CustomPasswordField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Consumer<PasswordController>(
        builder: (context, passwordController, child) {
          return TextField(
            controller: widget.controller,
            obscureText: !passwordController.isPasswordVisible,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 16, color: AppColors.light),
              fillColor: AppColors.grey,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  passwordController.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  size: 23,
                  color: AppColors.light,
                ),
                onPressed: passwordController.togglePasswordVisibility,
              ),
            ),
            style: TextStyle(fontSize: 16, color: AppColors.light),
          );
        },
      ),
    );
  }
}


class CustomSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final String hintText;

  CustomSearchTextField({
    required this.controller,
    required this.onSubmitted,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 45,
        width: 300,
        child: TextField(
          controller: controller,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: AppColors.black, size: 30),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 19,
              color: AppColors.lavender,
            ),
            hintTextDirection: TextDirection.ltr,
            contentPadding: const EdgeInsets.only(bottom: 6),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: AppColors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: AppColors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: AppColors.white),
            ),
            filled: true,
            fillColor: AppColors.white,
          ),
        ),
      ),
    );
  }
}
