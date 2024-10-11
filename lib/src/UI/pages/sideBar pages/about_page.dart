import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("About this app"),
      ),
      body: const Column(
        children: [
          Text(
              """Welcome to our food product app! This app is inspired by the Open Food Facts project and leverages their extensive database to provide you with detailed information on food products. Whether you're looking to make healthier choices, understand nutritional information, or track the eco-impact of your food, this app gives you access to real-time data on thousands of products worldwide.

By using the Open Food Facts API, we aim to bring transparency to your shopping experience, making it easier to find products that match your dietary and environmental preferences.

Our mission is to empower you with the tools to make informed decisions, and we’re constantly working on improving the app to enhance your experience.

Thank you for using our app!""")
        ],
      ),
    ));
  }
}
