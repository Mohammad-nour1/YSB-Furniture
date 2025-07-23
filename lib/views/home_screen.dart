import 'package:ecommerce/controllers/category_controller.dart';
import 'package:ecommerce/controllers/mostsold_products_controller.dart';
import 'package:ecommerce/models/category.dart';
import 'package:ecommerce/models/favorite.dart';
import 'package:ecommerce/models/productdetails.dart';
import 'package:ecommerce/routes/app_routes.dart';

import 'package:ecommerce/views/cart_screen.dart';
import 'package:ecommerce/views/categories_screen.dart';
import 'package:ecommerce/views/favorites_screen.dart';
import 'package:ecommerce/views/profile_screen.dart';
import 'package:ecommerce/views/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controllers/favorites_controller.dart'; 

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 2;
  DateTime? lastPressed; 
  final List<Widget> _pages = [
    CategoriesScreen(),
    const FavoritesScreen(),
    HomePage(), 
    const CartScreen(),
    ProfileScreen(),
  ];

  final List<PreferredSizeWidget> _appBars = [
    AppBar(title: const Text('Categories')),
    AppBar(title: const Text('Favorites')),
    HomePageAppBar(), 
    AppBar(title: const Text('Cart')),
    AppBar(title: const Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_page == 2) {
          DateTime now = DateTime.now();
          if (lastPressed == null ||
              now.difference(lastPressed!) > const Duration(seconds: 2)) {
            lastPressed = now;

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('اضغط مرة أخرى للخروج'),
                duration: Duration(seconds: 2),
              ),
            );
            return false; 
          } else {
            SystemNavigator.pop(); 
            return false;
          }
        }
        return true;
      },
      child: Scaffold(
        appBar: _page == 2
            ? _appBars[_page]
            : null, 
        body: _pages[_page], 
        bottomNavigationBar: CurvedNavigationBar(
          index: _page,
          height: 50.0,
          items: const <Widget>[
            Icon(Icons.category_outlined, size: 30, color: Colors.black45),
            Icon(Icons.favorite, size: 30, color: Colors.black45),
            Icon(Icons.home, size: 30, color: Colors.black45),
            Icon(Icons.shopping_bag, size: 30, color: Colors.black45),
            Icon(Icons.person, size: 30, color: Colors.black45),
          ],
          buttonBackgroundColor: Colors.orange,
          backgroundColor: const Color.fromARGB(137, 245, 185, 95),
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            if (index >= 0 && index < _pages.length) {
              setState(() {
                _page = index; 
              });
            }
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Home',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading:
                          const Icon(Icons.settings, color: Colors.blueGrey),
                      title: const Text('Settings',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {
                        Navigator.pop(context); 
                        _showSettingsDialog(context); 
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Get.to(SearchScreen());
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Get.to(const CartScreen());
          },
        ),
      ],
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Settings'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              ListTile(
                leading: const Icon(Icons.brightness_6_outlined),
                title: const Text('Themes'),
                onTap: () {
                  Get.back(); 
                  _showThemeChangeDialog(context); 
                },
              ),
              const Divider(
                color: Colors.orange,
                thickness: 3, 
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); 
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), 
                ),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }


  void _showThemeChangeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.wb_sunny, color: Colors.orange),
                title: const Text('Light Theme'),
                trailing: Get.isDarkMode
                    ? null
                    : const Icon(Icons.check, color: Colors.green),
                onTap: () {
                  Get.changeThemeMode(
                      ThemeMode.light); 
                  Get.back(); 
                },
              ),
              const Divider(
                color: Colors.orange,
                thickness: 3,
              ),
              ListTile(
                leading:
                    const Icon(Icons.nightlight_round, color: Colors.blueGrey),
                title: const Text('Dark Theme'),
                trailing: Get.isDarkMode
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  Get.changeThemeMode(
                      ThemeMode.dark); 
                  Get.back(); 
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); 
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), 
                ),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; 
  int selectedCategoryIndex = 0;

  String selectedCategory = 'Sofas'; 
  final CategoryController categoryController = Get.put(CategoryController());
  final MostSoldProductsController mostSoldProductsController =
      Get.put(MostSoldProductsController());
  final List<String> topCarouselImages = [
    'https://images.pexels.com/photos/716738/pexels-photo-716738.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/6115040/pexels-photo-6115040.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/7317346/pexels-photo-7317346.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/5650026/pexels-photo-5650026.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];
  final List<String> carouselImages = [
    'https://images.pexels.com/photos/279652/pexels-photo-279652.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/923192/pexels-photo-923192.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/7195558/pexels-photo-7195558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/191703/pexels-photo-191703.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];
  

  @override
  Widget build(BuildContext context) {
    
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            items: topCarouselImages.map((image) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 7.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 174,
                    placeholder: (context, url) => const SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 174,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),

          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'New collection\nWith ',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: '15% ',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                ),
                TextSpan(
                  text: 'discount',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Carousel Slider
          Stack(
            children: [
              CarouselSlider(
                items: carouselImages.map((image) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,
                        width: 400,
                        height: 175,
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
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 170,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),

            
              Positioned(
                bottom: 1,
                left: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: carouselImages.map((url) {
                    int index = carouselImages.indexOf(url);
                    return Container(
                      width: 9.0,
                      height: 9.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 1.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? (isDarkMode ? Colors.white : Colors.white)
                            : (isDarkMode
                                ? const Color.fromARGB(102, 255, 253, 253)
                                : const Color.fromARGB(102, 255, 253, 253)),
                      ),
                    );
                  }).toList(),
                ),
              ),

              
              Positioned(
                bottom: -2,
                left: 0,
                right: 0,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(CategoriesScreen());
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 1),
                        backgroundColor: Colors.orange),
                    child: const Text(
                      'Shop Now',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 58,
            child: Obx(() {
              if (categoryController.categories.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                scrollDirection: Axis.horizontal,
                children: List.generate(categoryController.categories.length,
                    (index) {
                  return _buildCategoryButton(
                      categoryController.categories[index], index);
                }),
              );
            }),
          ),
          Obx(() {
            if (mostSoldProductsController.mostSoldProducts.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return _buildProductList();
          }),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(Category category, int index) {
    bool isSelected = selectedCategoryIndex ==
        index; 

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedCategoryIndex = index; 
            selectedCategory = category.name;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.orangeAccent : Colors.orange,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          category.name, 
          style: TextStyle(
            color: Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return SizedBox(
      height: 400,
      child: Obx(() {
        final filteredProducts = mostSoldProductsController.mostSoldProducts;
        return ListView.builder(
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return _buildProductItem(product as Product);
          },
        );
      }),
    );
  }

  Widget _buildProductItem(Product product) {
    final FavoritesController favoritesController =
        Get.find<FavoritesController>();

    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.PRODUCTS_DETAILS_SCREEN, arguments: product);
      },
      child: Container(
        margin: const EdgeInsets.all(32.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(product.mainImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 130,
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 4),
                      Obx(() {
                        bool isFavorite = favoritesController
                            .isFavorite(product as FavoriteProduct);
                        return IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: const Color.fromARGB(213, 244, 44, 44),
                          ),
                          onPressed: () {
                            favoritesController
                                .toggleFavorite(product as FavoriteProduct);
                          },
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
