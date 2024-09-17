import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
                      Color.fromRGBO(243, 161, 80, 1),
                      Color.fromRGBO(236, 255, 235, 187)
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                padding: const EdgeInsets.only(
                    top: 28, right: 0, left: 20, bottom: 40),
                width: double.infinity,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 45,
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
                          'Create new  Account! ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Please fill in the form to continue',
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
                          color: Colors.orange,
                          width: 250,
                          height: 250,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
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
                    const SizedBox(height: 30),

                    // Sign In Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21),
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
                          'Create Account',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.LOGIN);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have an Account? ",
                            style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          const Text(
                            "log in",
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
