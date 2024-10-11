import 'package:hooks_riverpod/hooks_riverpod.dart';

class DesignIndex extends StateNotifier<int> {
  //? index-1
  //!Do not change
  DesignIndex() : super(-1);

  void setIndex(int index) {
    state = index;
  }
}

final designStyleIndexNotifier = StateNotifierProvider<DesignIndex, int>(
  (ref) => DesignIndex(),
);
