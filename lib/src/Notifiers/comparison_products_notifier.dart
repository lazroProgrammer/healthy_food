import 'package:healthy_food/src/data%20classes/open_food_pub/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductCompareNotifier extends StateNotifier<ProductHandler?> {
  ProductCompareNotifier() : super(null);

  Future<bool> search({required String barcode}) async {
    state = await ProductHandler.fetchProductDataByCode(barcode);
    // Logger().i(state);
    return false;
  }

  void clear() {
    state = null;
  }
}

final product1CompareNotifier =
    StateNotifierProvider<ProductCompareNotifier, ProductHandler?>((ref) {
  return ProductCompareNotifier();
});
final product2CompareNotifier =
    StateNotifierProvider<ProductCompareNotifier, ProductHandler?>((ref) {
  return ProductCompareNotifier();
});
