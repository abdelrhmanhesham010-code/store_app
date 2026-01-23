import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_services.dart';
import 'package:store_app/widget/custom_Card.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  static String id = 'homePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(color: Colors.black, Icons.shopping_cart),
          ),
        ],
        title: Text(
          'MY store',
          style: TextStyle(fontFamily: 'Lora', fontStyle: FontStyle.italic),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
        child: FutureBuilder<List<ProductModel>>(
          future: ProductsServices().getAllProduct(),
          // initialData: InitialData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.6,
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 7,
                ),
                // itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return CustomCard(product: products[index],);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
