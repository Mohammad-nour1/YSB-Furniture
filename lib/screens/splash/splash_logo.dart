import 'package:ecommerce/screens/splash/splash_screen1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// لاحقاً سننشئ شاشة الرئيسية

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام Future.delayed لتأخير الانتقال إلى الشاشة الرئيسية
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(const SplashScreen1());
    });

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/SplashLogo.png', // شعار التطبيق
              fit: BoxFit.cover, // تغطية كامل الشاشة
            ),
          ),
        ],
      ),
    );
  }
}
