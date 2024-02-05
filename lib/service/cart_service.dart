import 'package:dio/dio.dart';
import 'package:flutter_app_2/models/cart_mobdel.dart';
import 'package:flutter_app_2/network_settings.dart';

class CartService {
  static final dio = Dio();

  static Future<List<Product>> getCartData() async {
    final response = await dio.get("${NetworkSettings.baseUrl}cart/1");
    var data = response.data;
    CartModel cartModel = CartModel.fromJson(data);

    return cartModel.cart ?? [];
  }
}
