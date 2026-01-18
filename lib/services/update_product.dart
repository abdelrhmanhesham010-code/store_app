import 'package:store_app/constans.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductServics {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    String ?category,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: '$basUrl/products',
      data: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }

}
