import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../routes/app_routes.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  int _currentIndex = 0;
  final List<String> imgList = [
    'https://images.pexels.com/photos/4049942/pexels-photo-4049942.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/6331230/pexels-photo-6331230.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/7309468/pexels-photo-7309468.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 10,
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  'assets/logos/logo_YSB.png',
                  width: 72,
                  height: 72,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Nicely \nDesigned',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 36),
              Column(
                children: [
                  Transform.translate(
                    offset: const Offset(
                        -10, -45), // تحريك الصورة إلى الأعلى بمقدار 35 بكسل
                    child: Image.asset(
                      'assets/logos/lin.png',
                      color: Colors.orange,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 300.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: imgList
                .map((item) => Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: CachedNetworkImage(
                          imageUrl: item,
                          fit: BoxFit.cover,
                          width: 400,
                          height: 320,
                          placeholder: (context, url) => const SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(
                              strokeWidth: 1.0,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ))
                .toList(),
          ),
          Align(
            alignment: Alignment.centerLeft, // Align dots to the left
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 36.0), // Add 5 pixel left padding
              child: Row(
                children: imgList.map((url) {
                  int index = imgList.indexOf(url);
                  return Container(
                    width: 11.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 1.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? (isDarkMode
                              ? Colors.white
                              : const Color.fromRGBO(0, 0, 0, 0.9))
                          : (isDarkMode
                              ? const Color.fromRGBO(255, 255, 255, 0.4)
                              : const Color.fromRGBO(0, 0, 0, 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.LOGIN);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(
                        12), // Increase padding for larger button
                    shape: const CircleBorder(),
                    backgroundColor: Colors.orange,
                    elevation: 7,
                  ),
                  child: const Icon(Icons.arrow_forward,
                      color: Colors.black, size: 40),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
