import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project_1/models/product_model.dart';
import 'package:riverpod_project_1/providers/product_provider.dart';

class AddScreen extends ConsumerStatefulWidget {
  const AddScreen({
    super.key,
  });

  @override
  ConsumerState<AddScreen> createState() {
    return _AddScreenState();
  }
}

class _AddScreenState extends ConsumerState<AddScreen> {
  late final TextEditingController titleController;

  late final TextEditingController descriptionController;

  late final TextEditingController categoryController;

  late final TextEditingController priceController;

  late final TextEditingController imageController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController();

    descriptionController = TextEditingController();

    categoryController = TextEditingController();

    priceController = TextEditingController();

    imageController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();

    descriptionController.dispose();

    categoryController.dispose();

    priceController.dispose();

    imageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Listen for success / error
    ref.listen(
      productProvider,
      (previous, next) {
        // Success
        if (previous?.isLoading == true &&
            next.hasValue) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Product added successfully",
              ),
            ),
          );

          Navigator.pop(context);
        }

        // Error
        if (previous?.isLoading == true &&
            next.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Error: ${next.error}",
              ),
            ),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Product",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: "Description",
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            TextField(
              controller: categoryController,
              decoration: const InputDecoration(
                labelText: "Category",
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,

              decoration: const InputDecoration(
                labelText: "Price",
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            TextField(
              controller: imageController,

              decoration: const InputDecoration(
                labelText: "Image URL",
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            ElevatedButton(
              onPressed: () {
                final product = ProductModel(
                  id: 0,

                  title: titleController.text,

                  description:
                      descriptionController.text,

                  category:
                      categoryController.text,

                  price: double.parse(
                    priceController.text,
                  ),

                  image: imageController.text,
                );

                // Call Notifier
                ref
                    .read(
                      productProvider.notifier,
                    )
                    .addProduct(product);
              },

              child: const Text(
                "Add Product",
              ),
            ),
          ],
        ),
      ),
    );
  }
}