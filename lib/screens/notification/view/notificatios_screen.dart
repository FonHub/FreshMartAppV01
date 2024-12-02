import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of notifications
    final List<String> notifications = [
      "Your order #1234 has been shipped.",
      "A new product is available in our store!",
      "Your wishlist item is back in stock.",
      "Flash sale starts in 1 hour! Don’t miss out.",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          IconButton(
            onPressed: () {
              // Implement additional options here
            },
            icon: SvgPicture.asset(
              "assets/icons/DotsV.svg",
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: notifications.isEmpty
            ? const Center(
                child: Text("No notifications available."),
              )
            : ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.notifications,
                        color: Theme.of(context).primaryColor),
                    title: Text(notifications[index]),
                  );
                },
              ),
      ),
    );
  }
}
