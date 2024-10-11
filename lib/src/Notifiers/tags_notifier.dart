import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagNotifier extends StateNotifier<List<String>> {
  TagNotifier() : super([]);
  // Toggle tag selection
  void toggleTag(String tag) {
    if (state.contains(tag)) {
      state = state.where((t) => t != tag).toList();
    } else {
      state = [...state, tag];
    }
  }

  void setTags(List<String> tags) {
    state = tags;
  }
}

// Provider to expose the TagNotifier
final tagNotifierProvider =
    StateNotifierProvider<TagNotifier, List<String>>((ref) {
  return TagNotifier();
});
