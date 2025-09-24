import 'package:flutter/material.dart';
import 'products_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'lottie_splash.dart';

class DashboardScreen extends StatelessWidget {
  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Exit App"),
        content: Text("Are you sure to exit app?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx), // No
            child: Text("No"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Future.delayed(Duration(milliseconds: 200), () {
                // Exit app
                Navigator.of(context).pop(true);
              });
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  Widget buildCard(BuildContext context, IconData icon, String title, String subtitle, String lottieFile, Widget nextScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LottieSplash(
              lottieFile: lottieFile,
              nextScreen: nextScreen,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: Icon(icon, size: 40, color: Colors.deepPurple),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _showExitDialog(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, Admin !", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
            SizedBox(height: 5),
            Text("welcome back to your dashboard"),
            SizedBox(height: 20),
            buildCard(context, Icons.shopping_cart, "Products", "Browse Our Collection", "assets/cart.json", ProductsScreen()),
            buildCard(context, Icons.person, "Profile", "Manage Your Profile", "assets/profile.json", ProfileScreen()),
            buildCard(context, Icons.settings, "Settings", "App Preferences", "assets/settings.json", SettingsScreen()),
          ],
        ),
      ),
    );
  }
}
