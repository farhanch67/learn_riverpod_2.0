import 'package:flutter_riverpod/flutter_riverpod.dart';

//Used to store/access immutable values
final nameProvider = Provider<String>(
  (ref) {
    return 'FARHAN ASLAM';
  },
);

//State provider can be listen/watch and read.
final counterProvider = StateProvider<int>((ref) {
  return 0;
});

//state-notifier Provider (Recommended solution from Riverpod):

class CounterWithNotifier extends StateNotifier<int> {
  CounterWithNotifier() : super(0);

  void increment() {
    state++;
  }
}
