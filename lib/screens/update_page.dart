import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widget/Snak_Bar.dart';
import 'package:store_app/widget/cusstom_TextField.dart';
import 'package:store_app/widget/cusstom_button.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({super.key});
  static String id = 'updatePage';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? image, productName, description;

  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
              onPressed: () async{
                isLoading = true;
                setState(() {});
                try {
                await  updateTap(product);
                  showSuccessSnackBar(context);
                } catch (e) {
                  errorSuccessSnackBar(context);
                  print(e);
                }
                isLoading = false;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateTap(ProductModel product) async {
    await UpdateProductServics().updateProduct(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
