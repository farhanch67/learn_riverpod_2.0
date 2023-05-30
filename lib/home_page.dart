import 'package:flutter/material.dart';

import 'providers/future_provider.dart';
import 'providers/simple_provider.dart';
import 'providers/state_notifier_provider.dart';
import 'providers/state_provider.dart';
import 'providers/stream_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod 2.0'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  ListTile(
                    title: const Text('Simple Provider'),
                    subtitle: const Text('Using Consumer'),
                    tileColor: Colors.black12,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const SimpleProvider();
                        },
                      ));
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ListTile(
                    title: const Text('State Provider'),
                    subtitle: const Text('Using Consumer'),
                    tileColor: Colors.black12,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const StateProviderScreen();
                        },
                      ));
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ListTile(
                    title: const Text('State Notifier Provider'),
                    subtitle: const Text('Using Consumer'),
                    tileColor: Colors.black12,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const StateNotifierProviderScreen();
                        },
                      ));
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ListTile(
                    title: const Text('Future Provider'),
                    subtitle: const Text('Using Consumer'),
                    tileColor: Colors.black12,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const FutureProviderScreen();
                        },
                      ));
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ListTile(
                    title: const Text('Stream Provider'),
                    subtitle: const Text('Using Consumer'),
                    tileColor: Colors.black12,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const StreamProviderScreen();
                        },
                      ));
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}