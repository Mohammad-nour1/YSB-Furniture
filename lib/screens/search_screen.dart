import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // المتغيرات الخاصة بالفلترة
  List<String> selectedCategories = [];
  RangeValues selectedPriceRange =
      RangeValues(50, 300); // نطاق الأسعار الافتراضي

  final List<String> categories = [
    'Livingroom',
    'Clock',
    'Table',
    'Chair',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search Furniture...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.black),
          ),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الفئات المختارة
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: categories.map((category) {
                return FilterChip(
                  label: Text(category),
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

          // نطاق الأسعار
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price Range',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                    Text('\$${selectedPriceRange.start.round()}'),
                    Text('\$${selectedPriceRange.end.round()}'),
                  ],
                ),
              ],
            ),
          ),

          // النتيجة الفعلية (بدون منتجات)
          Expanded(
            child: Center(
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
