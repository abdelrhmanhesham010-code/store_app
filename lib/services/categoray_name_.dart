import 'package:dio/dio.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/constans.dart';

class CategoryName {
  final Dio dio = Dio();
  Future<List<ProductModel>> getCategoryName({
    required String nameCategory,
  }) async {
    final Response response = await dio.get(
      '$basUrl/products/category/$nameCategory',
    );
    List<dynamic> data = response.data;
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
