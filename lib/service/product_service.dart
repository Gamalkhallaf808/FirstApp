import 'package:dio/dio.dart';
import 'package:flutter_app_2/models/product_model.dart';
import 'package:flutter_app_2/network_settings.dart';

class ProductsService {
  static final dio = Dio();

  static Future<List<Product>> getProductsData() async {
    final response = await dio.get("${NetworkSettings.baseUrl}products");
    var data = response.data;
    ProductsModel productsModel = ProductsModel.fromJson(data);

    return productsModel.product ?? [];
  }
}
