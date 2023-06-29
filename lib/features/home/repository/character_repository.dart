import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/services/rick_and_morty_service.dart';
import '../../../core/models/character_model.dart';

final characterRepositoryProvider = Provider<CharacterRepository>(
  (ref) => CharacterRepository(
    client: ref.read(graphQLClientProvider),
  ),
);

class CharacterRepository {
  final GraphQLClient client;

  CharacterRepository({
    required this.client,
  });

  Future<List<Character>> getAllCharacters() async {
    const String query = r'''
      query GetAllCharacters {
        characters {
          results {
            id
            name
            species
            status
            image
          }
        }
      }
    ''';

    final List<Character> characters = await _fetchCharacters(query);
    return characters;
  }

  Future<List<Character>> searchCharacters(String searchQuery) async {
    const String query = r'''
      query SearchCharacters($searchQuery: String!) {
        characters(filter: { name: $searchQuery }) {
          results {
            id
            name
            species
            status
            image
          }
        }
      }
    ''';

    final List<Character> characters =
        await _fetchCharacters(query, variables: {'searchQuery': searchQuery});
    return characters;
  }

  Future<List<Character>> _fetchCharacters(String query,
      {Map<String, dynamic>? variables}) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables ?? {},
    );

    final QueryResult result = await client.query(options);
    if (result.hasException) {
      print(result.exception.toString());
      return [];
    }

    final List<dynamic>? rawCharacters =
        result.data?['characters']['results'] as List<dynamic>?;

    final List<Character> characters = rawCharacters?.map((rawCharacter) {
          return Character(
            name: rawCharacter['name'] as String? ?? 'Unknown',
            species: rawCharacter['species'] as String? ?? 'Unknown',
            status: rawCharacter['status'] as String? ?? 'Unknown',
          );
        }).toList() ??
        [];

    return characters;
  }
}
