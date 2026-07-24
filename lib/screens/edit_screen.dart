import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project_1/models/product_model.dart';

class EditScreen extends ConsumerStatefulWidget {
  final ProductModel product;

  const EditScreen({super.key, required this.product});

  @override
  ConsumerState<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends ConsumerState<EditScreen> {
  double scale = 1.0;

  late TextEditingController titleController;
  late TextEditingController categoryController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.product.title);

    categoryController = TextEditingController(text: widget.product.category);

    descriptionController = TextEditingController(
      text: widget.product.description,
    );

    priceController = TextEditingController(
      text: widget.product.price.toString(),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    categoryController.dispose();
    descriptionController.dispose();
    priceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Product")),

      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Product Card
            Card(
              margin: const EdgeInsets.all(10),
              color: const Color.fromARGB(251, 247, 237, 49),

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Product Image
                    GestureDetector(
                      onTapDown: (_) {
                        setState(() {
                          scale = 0.9;
                        });
                      },

                      onTapUp: (_) {
                        setState(() {
                          scale = 1.0;
                        });

                        // TODO: Image picker options
                      },

                      onTapCancel: () {
                        setState(() {
                          scale = 1.0;
                        });
                      },

                      child: AnimatedScale(
                        scale: scale,
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeInOut,

                        child: Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(10),

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 3),
                            color: Colors.white,
                          ),

                          child: ClipOval(
                            child: product.image.isNotEmpty
                                ? Image.network(
                                    product.image,
                                    fit: BoxFit.cover,

                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.image_not_supported,
                                        size: 40,
                                      );
                                    },
                                  )
                                : const Icon(Icons.image, size: 40),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Product Details
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
                          // Title
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
                                controller: titleController,
                                maxLines: 2,

                                decoration: const InputDecoration(
                                  hintText: "Enter title",
                                ),
                              ),
                            ],
                          ),

                          // Category
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
                                controller: categoryController,

                                decoration: const InputDecoration(
                                  hintText: "Enter category",
                                ),
                              ),
                            ],
                          ),

                          // Description
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
                                controller: descriptionController,
                                maxLines: 2,

                                decoration: const InputDecoration(
                                  hintText: "Enter description",
                                ),
                              ),
                            ],
                          ),

                          // Price
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
                                controller: priceController,
                                keyboardType: TextInputType.number,

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

            const SizedBox(height: 16),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // TODO: Save updated product
              },
              child: const Text("SAVE"),
            ),
          ],
        ),
      ),
    );
  }
}
