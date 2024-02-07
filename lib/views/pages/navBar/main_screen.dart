import 'package:flutter/material.dart';
import 'package:flutter_app_2/models/product_model.dart';
import 'package:flutter_app_2/views/pages/product_details_screen.dart';
import 'package:flutter_app_2/service/product_service.dart';
import 'package:flutter_app_2/views/widget/item_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLoading = true;
  List<Product> productList = [];

  Future<void> getData() async {
    productList = await ProductsService.getProductsData();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                                product: productList[index],
                              )),
                    );
                  },
                  child: ItemCard(
                    productName: productList[index].title ?? "--",
                    price: "${productList[index].price}",
                    thumbnail: productList[index].thumbnail ?? "", quantity: null?? "",
                  ));
            },
          );
  }
}
