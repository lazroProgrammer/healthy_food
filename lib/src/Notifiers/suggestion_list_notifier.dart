import 'package:hooks_riverpod/hooks_riverpod.dart';

class SuggestionListNotifier extends StateNotifier<List<String>> {
  SuggestionListNotifier() : super([]);
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

// Provider to expose the SuggestionListNotifier
final suggestionListNotifier =
    StateNotifierProvider<SuggestionListNotifier, List<String>>((ref) {
  return SuggestionListNotifier();
});
