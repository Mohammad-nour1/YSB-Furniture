import 'package:ecommerce/screens/room_inspiration_screen.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/categories_screen.dart';
import 'package:ecommerce/screens/check_out_screen.dart';
import 'package:ecommerce/screens/favorites_screen.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/product_details_screen.dart';
import 'package:ecommerce/screens/product_screen.dart'; // تأكد من أن الاسم يتطابق مع AppRoutes
import 'package:ecommerce/screens/profile_screen.dart';
import 'package:ecommerce/screens/search_screen.dart';
import 'package:ecommerce/screens/splash/splash_logo.dart';
import 'package:get/get.dart';
import '../screens/splash/splash_screen1.dart';
import '../screens/auth/log_in_screen.dart';
import '../screens/auth/sign_up_screen.dart';
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
        page: () => ProductsScreen()), // تأكد من تطابق الاسم
    GetPage(name: AppRoutes.FAVORITES_SCREEN, page: () => FavoritesScreen()),
    GetPage(
        name: AppRoutes.CATEGORIES_SCREEN,
        page: () => CategoriesScreen()), // تأكد من تطابق الاسم
    GetPage(name: AppRoutes.SIGNUP, page: () => const SignUpScreen()),
    GetPage(
        name: AppRoutes.PROFILE_SCREEN,
        page: () => ProfileScreen()), // تأكد من تطابق الاسم
    GetPage(
        name: AppRoutes.ROOM_INSPIRATION_SCREEN,
        page: () => RoomInspirationScreen()), // تأكد من تطابق الاسم
    GetPage(name: AppRoutes.CHECK_OUT_SCREEN, page: () => CheckoutScreen()),
    GetPage(
        name: AppRoutes.PRODUCTS_DETAILS_SCREEN,
        page: () => ProductDetailsScreen()), // تأكد من تطابق الاسم
  ];
}
