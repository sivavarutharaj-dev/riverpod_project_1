import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project_1/models/product_model.dart';
import 'package:riverpod_project_1/services/api_service.dart';

class ProductNotifier extends AsyncNotifier<List<ProductModel>> {
  @override
  Future<List<ProductModel>> build() async {
    return ApiService().getProducts();
  }

  Future<void> addProduct(ProductModel product) async {
    final currentProducts = state.value ?? [];

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final addedProduct = await ApiService().addProduct(product: product);

      return [...currentProducts, addedProduct];
    });
  }


}
  final productProvider =
    AsyncNotifierProvider<
        ProductNotifier,
        List<ProductModel>
    >(
      ProductNotifier.new,
    );