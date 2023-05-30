import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/providers/all_providers.dart';

class StateNotifierProviderScreen extends StatelessWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Provider'),
        backgroundColor: Colors.amber,
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                  onPressed: () {
                    ref.refresh(counterNotifier);
                    // ref.invalidate(counterProvider);
                    // ref.read(counterProvider.notifier).update((state) => state = 0);
                  },
                  icon: const Icon(Icons.refresh));
            },
          )
        ],
      ),
      body: const CounterNotifier(),
    );
  }
}

final counterNotifier =
    StateNotifierProvider.autoDispose<CounterWithNotifier, int>(
        (ref) => CounterWithNotifier());

class CounterNotifier extends ConsumerWidget {
  const CounterNotifier({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifier);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Notifier Counter $counter'),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                ref.read(counterNotifier.notifier).increment();
              },
              child: const Text(
                'Update State Notifier',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }
}
