import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/views/categories_screen.dart';
import 'package:ecommerce/views/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<Map<String, String>> addresses = [];

  void _addNewAddress(String title, String address) {
    setState(() {
      addresses.add({"title": title, "address": address});
    });
  }

  void _editAddress(int index, String title, String address) {
    setState(() {
      addresses[index] = {"title": title, "address": address};
    });
  }

  void _showAddAddressDialog({int? index}) {
    TextEditingController titleController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    if (index != null) {
      titleController.text = addresses[index]['title']!;
      addressController.text = addresses[index]['address']!;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? 'Add New Address' : 'Edit Address'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style:
                    TextStyle(color: Color.fromARGB(255, 255, 132, 24)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    addressController.text.isNotEmpty) {
                  if (index == null) {
                    _addNewAddress(
                        titleController.text, addressController.text);
                  } else {
                    _editAddress(
                        index, titleController.text, addressController.text);
                  }
                  Navigator.of(context).pop();
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
              ),
              child: Text(
                index == null ? 'Add' : 'Save',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _navigateToCheckoutStep2() {
    if (addresses.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one address.')),
      );
      return;
    }

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CheckoutStep2Screen(
        addresses: addresses,
        showAddAddressDialog: _showAddAddressDialog,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Checkout (1/2)'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Select Delivery Address',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
          
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text(addresses[index]['title']!),
                      subtitle: Text(addresses[index]['address']!),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _showAddAddressDialog(index: index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
           
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 241, 218),
                borderRadius: BorderRadius.circular(28),
              ),
              child: TextButton.icon(
                onPressed: _showAddAddressDialog,
                icon: const Icon(Icons.add, color: Colors.deepOrangeAccent),
                label: const Text(
                  'Add New Address',
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: _navigateToCheckoutStep2,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'CONTINUE',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutStep2Screen extends StatelessWidget {
  final List<Map<String, String>> addresses;
  final Function({int? index}) showAddAddressDialog;

  CheckoutStep2Screen(
      {required this.addresses, required this.showAddAddressDialog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Checkout (2/2)'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

          
            Container(
              padding: const EdgeInsets.all(22),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://t3.ftcdn.net/jpg/05/74/43/12/240_F_574431210_icdpLDlDxAfsNacnV56vIWb4pCRnaNBA.jpg",
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const Text(
              'Address',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
         
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text(addresses[index]['title']!),
                      subtitle: Text(addresses[index]['address']!),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          showAddAddressDialog(index: index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const Text(
              'Recently Used',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPaymentCard('Card 1'),
                  _buildPaymentCard('Card 2'),
                  _buildPaymentCard('Card 3'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Continue Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Succeeded(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'CONFIRM',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Succeeded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('The procedure succeeded'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 180,
            ),
            Center(
              child: Container(
                width: 240,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(113, 236, 189, 47),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logos/succes.png",
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Order Success',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      'Your order XXXXX is completed\nPlease Check the delivery status\nat Order Tracking page',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
          
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'CONFIRM',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPaymentCard(String cardName) {
  return Container(
    width: 120,
    margin: const EdgeInsets.all(6),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: Text(cardName),
    ),
  );
}
