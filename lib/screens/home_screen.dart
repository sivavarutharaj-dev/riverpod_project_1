import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_project_1/providers/product_provider.dart';
import 'package:riverpod_project_1/screens/add_screen.dart';
import 'package:riverpod_project_1/screens/product_details.dart';
import 'package:riverpod_project_1/widgets/product_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final productState = ref.watch(
      productProvider,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products",
        ),
      ),

      body: productState.when(
        // Loading
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },

        // Error
        error: (error, stack) {
          return Center(
            child: Text(
              "Error: $error",
            ),
          );
        },

        // Data
        data: (products) {
          if (products.isEmpty) {
            return const Center(
              child: Text(
                "No Products Found",
              ),
            );
          }

          return ListView.builder(
            
            itemCount: products.length,

            itemBuilder: (
              context,
              index,
            ) {
              final product =
                  products[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(product: product),
                    ),
                  );
                },

                child: ProductCard(
                product: product,
              )
              );
            },

            
          );
        },
      ),

      floatingActionButton:
          FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddScreen();
              },
            ),
          );
        },

        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}