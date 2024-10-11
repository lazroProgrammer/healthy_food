import 'package:flutter/material.dart';
import 'package:healthy_food/src/Notifiers/tags_notifier.dart';
import 'package:healthy_food/src/data%20classes/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; // Assuming this is where Product is located

class SelectedTagsWidget extends ConsumerWidget {
  const SelectedTagsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTags =
        ref.watch(tagNotifierProvider); // Watch provider for updates

    // Get the categories map (key: tag, value: localized label)
    final categoriesMap = Product.getCategoriesMap(context);

    if (selectedTags.isNotEmpty) {
      return Wrap(
        spacing: 8.0,
        children: selectedTags.map((tag) {
          // Use the localized label for the selected tag
          final translatedLabel =
              categoriesMap[tag] ?? tag; // Fallback to tag if not found
          return Chip(
            label: Text(translatedLabel),
            onDeleted: () {
              ref
                  .read(tagNotifierProvider.notifier)
                  .toggleTag(tag); // Remove tag on delete
            },
          );
        }).toList(),
      );
    } else {
      return const SizedBox();
    }
  }
}
