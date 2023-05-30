import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'all_providers.dart';

class SimpleProvider extends StatelessWidget {
  const SimpleProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Provider'),
        backgroundColor: Colors.amber,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UsingConsumerWidget(),
          Divider(),
          NameConsumer(),
          Divider(),
        ],
      ),
    );
  }
}

class UsingConsumerWidget extends ConsumerWidget {
  const UsingConsumerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Text("Using ConsumerWidget $name");
  }
}

class NameConsumer extends StatelessWidget {
  const NameConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //if the name value is changed it will be updated in consumer widget too.
    return Consumer(
      builder: (context, ref, child) {
        final name = ref.watch(nameProvider);
        return Text("Using Stateless widget with Consumer $name");
      },
    );
  }
}
