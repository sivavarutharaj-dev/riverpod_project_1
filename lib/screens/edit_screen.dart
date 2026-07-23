import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project_1/models/product_model.dart';

class EditScreen extends ConsumerWidget {
  final ProductModel product;

  const EditScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Product")),

      body: Center(
        child: Card(
          margin: const EdgeInsets.all(10),
          color: const Color.fromARGB(251, 247, 237, 49),

          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(product.image, height: 150),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),

                  child: Table(
                    columnWidths: const {
                      0: FixedColumnWidth(100),
                      1: FlexColumnWidth(),
                    },
                    children: [
                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "Title :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              hintText: "Enter title",
                            ),
                          ),
                        ],
                      ),

                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "Category :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              hintText: "Enter category",
                            ),
                          ),
                        ],
                      ),

                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "Description :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextField(
                            maxLines: 2,
                            decoration: const InputDecoration(
                              hintText: "Enter description",
                            ),
                          ),
                        ],
                      ),

                      TableRow(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "Price :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              hintText: "Enter price",
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
