import 'package:flutter/material.dart';
import 'package:kasani_fish/Controller/calendar_controller.dart';
import 'package:kasani_fish/Controller/dropdown_controller.dart';
import 'package:kasani_fish/Controller/password_controller.dart';
import 'package:kasani_fish/Controller/quantity_controller.dart';
import 'package:kasani_fish/view/auth/splash_screen.dart';
import 'package:provider/provider.dart';

import 'Controller/bottom_navbar_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordController()),
        ChangeNotifierProvider(create: (_) => QuantityController()),
        ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (_) => CalendarController()),
        ChangeNotifierProvider(create: (_) => DropdownController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(title: ''),
      ),
    );
  }
}
