import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Checkout (2/3)'),
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
              'Payment Method',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              '3 active cards',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            // Card Design
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Xool card',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Halal Lab',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '**** **** **** 1234',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Add New Address Button
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.orange),
                label: const Text(
                  'Add New Address',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Recently Used Section
            const Text(
              'Recently Used',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _recentlyUsedCard(
              logo: Icons.credit_card,
              paymentType: 'Mastercard',
              lastFourDigits: '3253',
              date: '15 April, 2021',
              iconColor: Colors.red,
            ),
            const SizedBox(height: 10),
            _recentlyUsedCard(
              logo: Icons.account_balance_wallet,
              paymentType: 'PayPal',
              lastFourDigits: 'Halal Lab',
              date: '18 April, 2021',
              iconColor: Colors.blue,
            ),
            const Spacer(),
            // Continue Button
            ElevatedButton(
              onPressed: () {
                // أضف هنا منطق الانتقال إلى الدفع
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
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

  Widget _recentlyUsedCard({
    required IconData logo,
    required String paymentType,
    required String lastFourDigits,
    required String date,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(logo, color: iconColor, size: 30),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    paymentType,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '**** **** **** $lastFourDigits',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            date,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
