import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod 2.0'),
        backgroundColor: Colors.amber,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(),
          StreamProviderDemo(),
        ],
      ),
    );
  }
}

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
        backgroundColor: Colors.amber,
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                  onPressed: () {
                    ref.refresh(streamProvider);
                    // ref.invalidate(counterProvider);
                    // ref.read(counterProvider.notifier).update((state) => state = 0);
                  },
                  icon: const Icon(Icons.refresh));
            },
          )
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: StreamProviderDemo()),
        ],
      ),
    );
  }
}

//Stream Provider
final streamProvider = StreamProvider.autoDispose<int>((ref) async* {
  yield* Stream.periodic(
    const Duration(seconds: 1),
    (computationCount) => computationCount,
  );
});

class StreamProviderDemo extends ConsumerWidget {
  const StreamProviderDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamDemo = ref.watch(streamProvider);
    return streamDemo.when(
      data: (data) => Text('Listening to a Stream ${data}'),
      error: (error, stackTrace) => Text("Error is ${error}"),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
