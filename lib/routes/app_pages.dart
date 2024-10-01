
import 'package:ecommerce/views/cart_screen.dart';
import 'package:ecommerce/views/categories_screen.dart';
import 'package:ecommerce/views/check_out_screen.dart';
import 'package:ecommerce/views/favorites_screen.dart';
import 'package:ecommerce/views/home_screen.dart';
import 'package:ecommerce/views/product_details_screen.dart';
import 'package:ecommerce/views/product_screen.dart';    
import 'package:ecommerce/views/profile_screen.dart';
import 'package:ecommerce/views/search_screen.dart';
import 'package:ecommerce/views/splash/splash_logo.dart';
import 'package:get/get.dart';
import '../views/splash/splash_screen1.dart';
import '../views/auth/log_in_screen.dart';
import '../views/auth/sign_up_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.SPLASH_LOGO, page: () => const SplashLogo()),
    GetPage(name: AppRoutes.SPLASH_SCREEN1, page: () => const SplashScreen1()),
    GetPage(name: AppRoutes.HOME_SCREEN, page: () => HomeScreen()),
    GetPage(name: AppRoutes.CART_SCREEN, page: () => CartScreen()),
    GetPage(name: AppRoutes.SEARCH_SCREEN, page: () => SearchScreen()),
    GetPage(name: AppRoutes.LOGIN, page: () => const LogInScreen()),
    GetPage(
        name: AppRoutes.PRODUCTS_SCREEN,
        page: () => ProductsScreen()), 
    GetPage(name: AppRoutes.FAVORITES_SCREEN, page: () => FavoritesScreen()),
    GetPage(
        name: AppRoutes.CATEGORIES_SCREEN,
        page: () => CategoriesScreen()), 
    GetPage(name: AppRoutes.SIGNUP, page: () =>  SignUpScreen()),
    GetPage(
        name: AppRoutes.PROFILE_SCREEN,
        page: () => ProfileScreen()),     
    
    GetPage(name: AppRoutes.CHECK_OUT_SCREEN, page: () => CheckoutScreen()),
    GetPage(
        name: AppRoutes.PRODUCTS_DETAILS_SCREEN,
        page: () => ProductDetailsScreen()),     
  ];
}
