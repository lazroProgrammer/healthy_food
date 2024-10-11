import 'package:healthy_food/src/data%20classes/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super([]);

  Future<bool> search(
      {int limit = 10,
      required List<String> categories,
      String? searchTerm}) async {
    state = await Product.fetchFoodProducts(
        limit: limit, categories: categories, searchTerm: searchTerm);
    return false;
  }
}

final productsListNotifier =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier();
});
