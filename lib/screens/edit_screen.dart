import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project_1/models/product_model.dart';

class EditScreen extends ConsumerWidget {
  final ProductModel product;

  const EditScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product"),
      ),

      body: Center(
        child: Card(
          margin: const EdgeInsets.all(10),
          color: const Color.fromARGB(251, 247, 237, 49),

          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  product.image,
                  height: 150,
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),

                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 100,
                            child: Text(
                              "Title :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: "Enter title",
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          const SizedBox(
                            width: 100,
                            child: Text(
                              "Category :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: "Enter category",
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                       
                        children: [
                          const SizedBox(
                            width: 100,
                            child: Text(
                              "Description :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Expanded(
                            child: TextField(
                              maxLines: 2,
                              decoration: const InputDecoration(
                                hintText: "Enter description",
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          const SizedBox(
                            width: 100,
                            child: Text(
                              "Price :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: "Enter price",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}