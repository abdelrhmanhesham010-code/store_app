import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widget/cusstom_TextField.dart';
import 'package:store_app/widget/cusstom_button.dart';

class UpdatePage extends StatelessWidget {
  UpdatePage({super.key});
  static String id = 'updatePage';
  String? image, productName, description;
  String? price;

  @override
  Widget build(BuildContext context) {
    // ProductModel product =
    //     ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Page',
          style: TextStyle(fontFamily: 'Lora', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        // elevation: 1.5,
      ),
      body: Column(
        children: [
          UpdateTextField(
            onchanged: (data) {
              productName = data;
            },
            hintText: 'Product Name',
          ),
          SizedBox(height: 7),
          UpdateTextField(
            onchanged: (data) {
              description = data;
            },
            hintText: 'description',
          ),
          SizedBox(height: 7),
          UpdateTextField(
            onchanged: (data) {
              price = data;
            },
            hintText: 'price',
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 7),
          UpdateTextField(
            onchanged: (data) {
              image = data;
            },
            hintText: 'image',
          ),
          SizedBox(height: 7),
          CustomButton(
            text: 'Update',
            onPressed: () {
              UpdateProductServics().updateProduct(
                title: productName!,
                price: price!,
                description: description!,
                image: image!,
                
              );
            },
          ),
        ],
      ),
    );
  }
}
