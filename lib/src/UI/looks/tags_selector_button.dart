import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/Notifiers/tags_notifier.dart';
import 'package:healthy_food/src/data%20classes/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagSelectorButton extends ConsumerWidget {
  const TagSelectorButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        final selectedTags = await showModalBottomSheet<List<String>>(
          context: context,
          builder: (BuildContext context) {
            return _CategorySelectorModal(
              initialTags: ref.read(tagNotifierProvider),
            );
          },
        );

        // If a new selection is returned, update the global state via the provider
        if (selectedTags != null) {
          ref.read(tagNotifierProvider.notifier).setTags(selectedTags);
        }
      },
      child: Text(AppLocalizations.of(context)!.choose_tags),
    );
  }
}

class _CategorySelectorModal extends ConsumerStatefulWidget {
  final List<String> initialTags;

  const _CategorySelectorModal({required this.initialTags});

  @override
  __CategorySelectorModalState createState() => __CategorySelectorModalState();
}

class __CategorySelectorModalState
    extends ConsumerState<_CategorySelectorModal> {
  // categories = [
  //   'Beverages',
  //   'Snacks',
  //   'Waters',
  //   'Dairy',
  //   'Fruits',
  //   'Vegetables',
  //   'Alcohol',
  // ];

  late List<String> _selectedTags;

  @override
  void initState() {
    super.initState();
    _selectedTags = widget.initialTags;
  }

  void _toggleTag(String category) {
    if (mounted) {
      setState(() {
        if (_selectedTags.contains(category)) {
          _selectedTags.remove(category);
        } else {
          _selectedTags.add(category);
        }
      });
    }
  }

  String getKeyFromValue(Map<String, String> map, String value) {
    return map.keys.firstWhere((k) => map[k] == value,
        orElse: () => "" // Return null if no key is found for the value
        );
  }

  @override
  Widget build(BuildContext context) {
    final dark = ref.watch(darkmodeNotifier);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context)!.choose_tags,
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children:
                  Product.getCategoriesMap(context).keys.map((categoryKey) {
                final isSelected = _selectedTags.contains(categoryKey);

                return ChoiceChip(
                  label: Text(Product.getCategoriesMap(context)[categoryKey]!),
                  selected: isSelected,
                  onSelected: (_) {
                    ref
                        .read(tagNotifierProvider.notifier)
                        .toggleTag(categoryKey);
                    _toggleTag(
                        categoryKey); // Local logic to update _selectedTags
                  },
                  selectedColor: (dark) ? Colors.blue[900] : Colors.blueAccent,
                  backgroundColor: (dark) ? Colors.grey[900] : Colors.grey[300],
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _selectedTags); // Return selected tags
              },
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
