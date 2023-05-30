import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api_service.dart';

class FutureProviderScreen extends StatelessWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
        backgroundColor: Colors.amber,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: ApiDataConsumer()),
        ],
      ),
    );
  }
}

//Future Provider
final apiService = Provider.autoDispose<ApiService>((ref) => ApiService());
final userDataProvider = FutureProvider.autoDispose<List<UserModel>>((ref) {
  return ref.read(apiService).getUser();
});

class ApiDataConsumer extends ConsumerWidget {
  const ApiDataConsumer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return userData.when(
      data: (data) {
        return Text(data[0].name);
      },
      error: (error, stackTrace) => Text('Error is ${error}'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
