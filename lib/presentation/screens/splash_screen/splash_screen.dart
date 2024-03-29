import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooth_note/infrastructure/services/secure_storage.dart';
import 'package:tooth_note/presentation/screens/home/screen_home.dart';
import 'package:tooth_note/presentation/screens/login/screen_login.dart';
import 'package:tooth_note/presentation/view_states/splash/riverpod_splash.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  double opacity = 0.0;
  @override
  void initState() {
    Timer(const Duration(seconds: 0), () {
      changeOPacity();
    });

    Timer(const Duration(seconds: 2), () {
      navigateUser();
    });
    super.initState();
  }

  changeOPacity() {
    // setState(() {
    //   opacity = 1.0;
    // });
    increaseOpacity(1.0, ref);
  }

  void navigateUser() async {
    await StorageService.instance.readSecureData('loginStatus').then((value) {
      if (value == null || value == 'false') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      } else {
        //h
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 13, 0),
      body: SafeArea(
        child: AnimatedOpacity(
          opacity: ref.watch(opacityProvider),
          duration: const Duration(seconds: 3),
          child: Center(
            child: Image.asset(
                'assets/images/WhatsApp_Image_2024-03-15_at_20.36.01-removebg-preview.png'),
          ),
        ),
      ),
    );
  }
}
