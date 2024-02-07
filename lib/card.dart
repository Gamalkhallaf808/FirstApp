import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2/models/cart_mobdel.dart';
import 'package:flutter_app_2/service/cart_service.dart';
import 'package:flutter_app_2/views/widget/item_card.dart';

class myCart extends StatefulWidget {
  const myCart({Key? key}) : super(key: key);

  @override
  State<myCart> createState() => _myCartState();
}

class _myCartState extends State<myCart> {
  bool isLoading = true;
  List<Product> cartList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    cartList = await CartService.getCartData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network('${cartList[index].thumbnail ?? ""}'),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          'Product Name: ${cartList[index].title ?? ""}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Text('quantity: ${cartList[index].quantity ?? ""}'),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                            'discounted Price: ${cartList[index].discountedPrice ?? ""}'),
                      ),
                      Text(
                          'price: ${cartList[index].price ?? ""}'),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text('discount Percentage: ${cartList[index].discountPercentage ?? ""}'),
                      ),
                      Text('Total: ${cartList[index].total ?? ""}'),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
