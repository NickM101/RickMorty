import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/services/rick_and_morty_service.dart';

final charactersProvider = FutureProvider<List<dynamic>>((ref) async {
  final service = ref.watch(rickAndMortyServiceProvider);
  final result = await service.getAllLocations();
  return result.data != null
      ? result.data!['locations']['results']
      : <dynamic>[];
});
