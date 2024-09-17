import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(66, 206, 248, 1),
                      Color.fromRGBO(189, 224, 244, 0.992)
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                padding: const EdgeInsets.only(
                    top: 32, right: 0, left: 20, bottom: 40),
                width: double.infinity,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            'assets/logos/Logo.png',
                            color: Colors.black,
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Welcome Back!',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Please sign in to your account',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Positioned(
                      top: 20, // تحديد الموضع الرأسي للصورة
                      left: 30, // تحديد الموضع الأفقي للصورة
                      child: Transform.translate(
                        offset: const Offset(65, -15),
                        child: Image.asset(
                          'assets/logos/cycle.png',
                          color: Colors.blue,
                          width: 250,
                          height: 250,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15), // المميزة النجمة
              Expanded(
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Password TextField
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.visibility),
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Remember Me and Forgot Password
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: false, onChanged: (bool? value) {}),
                              const Text('Remember'),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Forgot password logic
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.brown),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Sign In Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.HOME_SCREEN);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Log in',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('OR',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    const SizedBox(height: 10),
                    // Sign In with Google Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Sign in with Google logic
                        },
                        icon: Image.asset('assets/logos/google.png', width: 24),
                        label: const Text('Sign In with Google',
                            style: TextStyle(fontSize: 14)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(242, 232, 222, 1),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Sign Up Text
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.SIGNUP);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't Have an Account? ",
                            style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
