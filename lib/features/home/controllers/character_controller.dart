import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rickandmorty/core/models/character_model.dart';

import '../repository/character_repository.dart';

final charactersProvider = FutureProvider<List<Character>>((ref) async {
  final repository = ref.read(characterRepositoryProvider);
  return repository.getAllCharacters(1);
});
