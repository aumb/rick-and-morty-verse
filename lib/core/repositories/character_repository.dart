import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';
import 'package:rick_and_morty_verse/core/models/failure.dart';
import 'package:rick_and_morty_verse/core/utils/gql_query.dart';
import 'package:rick_and_morty_verse/core/utils/safe_print.dart';

abstract class CharacterRepositoryContract {
  Future<Either<Failure, List<Character?>>> getCharacters(int page);
}

class CharacterRepository implements CharacterRepositoryContract {
  const CharacterRepository(this._client);

  final GraphQLClient _client;

  @override
  Future<Either<Failure, List<Character?>>> getCharacters(int page) async {
    try {
      final result = await _client.query(
        QueryOptions(
          document: gql(GqlQuery.charactersQuery),
          variables: {'page': page},
        ),
      );
      if (result.hasException) {
        safePrint(result.exception.toString());
        return Left(ServerFailure());
      }
      if (result.data == null) {
        return const Right([]);
      }
      final _characterResponse = result.data?['characters'] as Map?;
      final _characterResults = _characterResponse?['results'];

      return Right(Character.fromJsonList(_characterResults) ?? []);
    } on Exception catch (exception) {
      safePrint(exception.toString());
      return Left(ServerFailure());
    }
  }
}
