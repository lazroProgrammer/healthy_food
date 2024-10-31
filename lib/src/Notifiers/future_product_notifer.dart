import 'package:healthy_food/src/data%20classes/open_food_pub/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Define a StateProvider to hold the search parameters
final productSearchParamsProvider =
    StateProvider<ProductSearchParams?>((ref) => null);

// Define the FutureProvider to fetch products based on the current search parameters
final productsProvider =
    FutureProvider.autoDispose<List<ProductHandler>>((ref) async {
  final searchParams = ref.watch(productSearchParamsProvider);
  if (searchParams == null) {
    return [];
  }

  return await ProductHandler.search(
    name: searchParams.searchTerm,
    categories: searchParams.categories,
    country: searchParams.country,
    detailed: searchParams.detailed,
  );
});

// The search parameters data class
class ProductSearchParams {
  final List<String> categories;
  final String? country;
  final bool? detailed;
  final String? searchTerm;

  ProductSearchParams({
    required this.categories,
    required this.country,
    required this.detailed,
    this.searchTerm,
  });
}
