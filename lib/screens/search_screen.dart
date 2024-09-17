import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // عملية الفلترة
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network('https://via.placeholder.com/150'),
            title: Text('Product $index'),
            subtitle: Text('Price: \$${index * 10}'),
          );
        },
      ),
    );
  }
}
