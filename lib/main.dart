import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'themes/themes.dart'; 

void main() {
  Get.put(FavoritesController());
  Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SPLASH_LOGO,
      getPages: AppPages.pages,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, 
    );
  }
}
