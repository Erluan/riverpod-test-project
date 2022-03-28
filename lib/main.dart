import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final helloWorldProvider = Provider((_) => 'Hello world');

final counterProvider = StateProvider((ref) => 0);

Future<void> main() async {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Note: MyApp is a HookConsumerWidget, from hooks_riverpod.
class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final String value = ref.watch(helloWorldProvider);
    final count = ref.watch(counterProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          // Consumer is a widget that allows you reading providers.
          child: Consumer(builder: (context, ref, _) {
            final count = ref.watch(counterProvider.state).state;
            return Text('$count');
          }),
        ),
        floatingActionButton: FloatingActionButton(
          // The read method is a utility to read a provider without listening to it
          onPressed: () => ref.read(counterProvider.state).state++,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}