// https://studio.apollographql.com/public/rick-and-morty-a3b90u/variant/current/schema/reference/objects
// https://www.freecodecamp.org/news/graphql-queries-for-everyone/

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final graphQLClientProvider = Provider<GraphQLClient>((ref) {
  final Link link = HttpLink('https://rickandmortyapi.com/graphql');
  return GraphQLClient(
    link: link,
    cache: GraphQLCache(),
  );
});
