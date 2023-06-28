import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final rickAndMortyServiceProvider = Provider<RickAndMortyService>((ref) {
  return RickAndMortyService();
});

class RickAndMortyService {
  final GraphQLClient _client;

  RickAndMortyService() : _client = _createClient();

  static GraphQLClient _createClient() {
    final Link link = HttpLink('https://rickandmortyapi.com/graphql');
    return GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );
  }

  Future<QueryResult> getAllCharacters() async {
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

    final QueryOptions options = QueryOptions(document: gql(query));

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
    }

    return result;
  }
}
