import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_page.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdatePage.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 20,
                  spreadRadius: 5,
                  offset: Offset(4, 2),
                ),
              ],
            ),

            child: Card(
              color: Colors.blue,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.title.substring(0, 14),
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Lora',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$'
                          '${product.price.toString()}',
                        ),
                        Icon(Icons.favorite, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: 75,
            child: Image.network(product.image, width: 100, height: 100),
          ),
        ],
      ),
    );
  }
}
