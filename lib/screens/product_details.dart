import 'package:flutter/material.dart';
import 'package:riverpod_project_1/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;

  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: [
          Text(product.title),
          Text(product.description),
          Text(product.price.toString()),
        ],
      ),
    );
  }
}