import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String productName;
  const ItemCard({Key? key, required this.productName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[100], borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.shopify),
              Text(productName),
              Text("100\$"),
            ],
          ),
        ),
      ),
    );
  }
}
