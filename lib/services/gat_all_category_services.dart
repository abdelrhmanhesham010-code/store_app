import 'package:dio/dio.dart';
import 'package:store_app/services/constans.dart';

class GatAllCategoryServices {
  final Dio dio = Dio();
  Future<List<dynamic>> getcategoryProduct() async {
    final Response response = await dio.get('$basUrl/products/categories');
    List<dynamic> data = response.data;
    return data;
  }
}
