import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String productName;
  final String price;
  final String thumbnail;
  const ItemCard({
    Key? key,
    required this.productName,
    required this.price,
    required this.thumbnail, required Object quantity,
  }) : super(key: key);
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
              SizedBox(width: 70, height: 70, child: Image.network(thumbnail)),
              Text(productName),
              Text("$price\$"),
            ],
          ),
        ),
      ),
    );
  }
}
