import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/services/rick_and_morty_service.dart';

final charactersProvider = FutureProvider<List<dynamic>>((ref) async {
  final service = ref.watch(rickAndMortyServiceProvider);
  final result = await service.getAllCharacters();
  return result.data != null
      ? result.data!['characters']['results']
      : <dynamic>[];
});

class RickAndMortyWidget extends HookConsumerWidget {
  const RickAndMortyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsyncValue = ref.watch(charactersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty Characters'),
      ),
      body: charactersAsyncValue.when(
        data: (characters) {
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return ListTile(
                leading: Image.network(character['image']),
                title: Text(character['name']),
                subtitle: Text(character['species']),
                trailing: Text(character['status']),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
