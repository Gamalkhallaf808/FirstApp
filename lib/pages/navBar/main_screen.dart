import 'package:flutter/material.dart';
import 'package:flutter_app_2/widget/item_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> productName = ["product 1", "mobile", "laptop"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productName.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemCard(productName: productName[index]);
      },

      // children: [
      // ItemCard(productName: productName[0]),
      // ],
    );
  }
}
