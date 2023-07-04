import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/character_details.dart';
import '../widgets/character_image.dart';

import '../controllers/character_controller.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

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
              return Container(
                margin: const EdgeInsets.fromLTRB(30, 12, 0, 12),
                child: Stack(
                  children: [
                    CharacterImage(
                      src: character.image,
                      id: character.name,
                    ),
                    Positioned(
                      right: 20,
                      bottom: 50,
                      child: CharacterDetails(
                        name: character.name,
                        species: character.species,
                        status: character.status,
                      ),
                    )
                  ],
                ),
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


// ListTile(
//                 title: Text(character.name),
//                 subtitle: Text(character.species),
//                 trailing: Text(character.status),
//               );