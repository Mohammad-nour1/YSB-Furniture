import 'package:ecommerce/views/splash/splash_screen1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(const SplashScreen1());
    });

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/SplashLogo.png',   
              fit: BoxFit.cover,    
            ),
          ),
        ],
      ),
    );
  }
}
