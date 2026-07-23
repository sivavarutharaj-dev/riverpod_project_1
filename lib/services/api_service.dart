import "package:dio/dio.dart";

import "package:riverpod_project_1/models/product_model.dart";

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://dummyjson.com",
    ),
  );

  // GET -> Products
  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get("/products");

    final List products = response.data["products"];

    return products
        .map(
          (product) => ProductModel.formJson(product),
        )
        .toList();
  }

  // DELETE -> Product
  Future<void> deleteProduct(int id) async {
    await dio.delete("/products/$id");
  }

  // PATCH -> Product
  Future<void> editProduct({
    required int id,
    String? title,
    double? price,
  }) async {
    await dio.patch(
      "/products/$id",
      data: {
        "price": price,
        "title": title,
      },
    );
  }

  // POST -> Product
  Future<ProductModel> addProduct({
    required ProductModel product,
  }) async {
    final response = await dio.post(
      "/products/add",
      data: {
        "title": product.title,
        "description": product.description,
        "category": product.category,
        "thumbnail": product.image,
        "price": product.price,
      },
    );

    return ProductModel.formJson(
      response.data,
    );
  }
}