import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project_1/models/product_model.dart';
import 'package:riverpod_project_1/screens/edit_screen.dart';

class ProductCard extends ConsumerWidget {
  final ProductModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Image.network(
          product.image,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),

        title: Text(
          product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.category),

            const SizedBox(height: 4),

            Text(
              "₹${product.price}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditScreen(product: product,)),
                );
                // Edit logic
              },
              icon: const Icon(Icons.edit),
              tooltip: "Edit",
            ),

            IconButton(
              onPressed: () {
                // Delete logic
              },
              icon: const Icon(Icons.delete),
              tooltip: "Delete",
            ),
          ],
        ),
      ),
    );
  }
}
