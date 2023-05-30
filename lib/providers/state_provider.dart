import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'all_providers.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
              onPressed: () {
                ref.refresh(counterProvider);
                // ref.invalidate(counterProvider);
                // ref.read(counterProvider.notifier).update((state) => state = 0);
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CounterConsumer(),
          Divider(),
          ConsumerStatefulTest(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
    );
  }
}

class ConsumerStatefulTest extends ConsumerStatefulWidget {
  const ConsumerStatefulTest({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ConsumerStatefulTestState();
}

class _ConsumerStatefulTestState extends ConsumerState<ConsumerStatefulTest> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterProvider);
    ref.listen(counterProvider, (previous, next) {
      if (next == 10) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Value is reached to ${next}')));
      }
    });
    return Text(
      'Stateful Consumer Widget is: $count',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class CounterConsumer extends StatelessWidget {
  const CounterConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final count = ref.watch(counterProvider);
        return Text("Using Stateless Widget & Consumer Counter: $count");
      },
    );
  }
}
