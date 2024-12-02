import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for cart items
    final List<Map<String, dynamic>> cartItems = [
      {"name": "Item 1", "price": 10.0, "quantity": 1},
      {"name": "Item 2", "price": 20.0, "quantity": 2},
      {"name": "Item 3", "price": 15.0, "quantity": 1},
    ];

    double totalPrice = cartItems.fold(0, (sum, item) => sum + item["price"] * item["quantity"]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ListTile(
                    title: Text(item["name"]),
                    subtitle: Text("Quantity: ${item["quantity"]}"),
                    trailing: Text("\$${item["price"] * item["quantity"]}"),
                  );
                },
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text("Total"),
              trailing: Text("\$$totalPrice"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement checkout functionality here
              },
              child: const Text("Proceed to Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}
