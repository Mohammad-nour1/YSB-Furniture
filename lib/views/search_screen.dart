import 'package:ecommerce/services/search_service.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/models/productdetails.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> selectedCategories = [];
  RangeValues selectedPriceRange = const RangeValues(50, 300);
  List<Product> searchedProducts = [];
  String searchQuery = '';
  final SearchService searchService = SearchService();

  final List<String> categories = [
    'Livingroom',
    'Clock',
    'Table',
    'Chair',
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final appBarColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        title: TextField(
          onChanged: (value) {
            searchQuery = value;
          },
          decoration: InputDecoration(
            hintText: 'Search Furniture...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.search, color: textColor),
              onPressed: () async {
                if (searchQuery.isNotEmpty) {
                  try {
                    searchedProducts =
                        await searchService.searchProducts(searchQuery);
                    setState(() {});
                  } catch (e) {
                    print(e);
                  }
                }
              },
            ),
          ),
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: categories.map((category) {
                return FilterChip(
                  label: Text(category, style: TextStyle(color: textColor)),
                  selected: selectedCategories.contains(category),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        selectedCategories.add(category);
                      } else {
                        selectedCategories.remove(category);
                      }
                    });
                  },
                  selectedColor: const Color.fromARGB(255, 247, 184, 57),
                  checkmarkColor: const Color.fromARGB(255, 16, 15, 13),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price Range',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: textColor),
                ),
                RangeSlider(
                  values: selectedPriceRange,
                  min: 0,
                  max: 500,
                  divisions: 50,
                  labels: RangeLabels(
                    '\$${selectedPriceRange.start.round()}',
                    '\$${selectedPriceRange.end.round()}',
                  ),
                  onChanged: (RangeValues newRange) {
                    setState(() {
                      selectedPriceRange = newRange;
                    });
                  },
                  activeColor: const Color.fromARGB(255, 243, 163, 33),
                  inactiveColor: const Color.fromARGB(255, 244, 213, 143),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${selectedPriceRange.start.round()}',
                        style: TextStyle(color: textColor)),
                    Text('\$${selectedPriceRange.end.round()}',
                        style: TextStyle(color: textColor)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: searchedProducts.isNotEmpty
                ? ListView.builder(
                    itemCount: searchedProducts.length,
                    itemBuilder: (context, index) {
                      final product = searchedProducts[index];
                      return ListTile(
                        title: Text(product.name,
                            style: TextStyle(color: textColor)),
                        subtitle: Text('\$${product.price}',
                            style: TextStyle(color: textColor)),
                        leading: Image.network(product.mainImage),
                        onTap: () {
                         
                        },
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No products to display, adjust filters to see results.',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
