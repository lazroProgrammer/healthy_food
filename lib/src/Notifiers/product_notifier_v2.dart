import 'package:healthy_food/src/data%20classes/open_food_pub/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductHandlerNotifier extends StateNotifier<List<ProductHandler>> {
  ProductHandlerNotifier() : super([]);

  Future<bool> search(
      {required List<String> categories,
      required String? country,
      required bool? detailed,
      String? searchTerm}) async {
    state = await ProductHandler.search(
        name: searchTerm,
        categories: categories,
        country: country,
        detailed: detailed);
    // Logger().i(state);
    return false;
  }
}

final productsListNotifier2 =
    StateNotifierProvider<ProductHandlerNotifier, List<ProductHandler>>((ref) {
  return ProductHandlerNotifier();
});
