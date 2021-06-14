import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_verse/core/models/episode/episode.dart';
import 'package:rick_and_morty_verse/core/models/failure.dart';
import 'package:rick_and_morty_verse/core/utils/gql_query.dart';
import 'package:rick_and_morty_verse/core/utils/safe_print.dart';

abstract class EpisodeRepositoryContract {
  Future<Either<Failure, List<Episode?>>> getEpisodes(int page);
}

class EpisodeRepository implements EpisodeRepositoryContract {
  const EpisodeRepository(this._client);

  final GraphQLClient _client;

  @override
  Future<Either<Failure, List<Episode?>>> getEpisodes(int page) async {
    try {
      final result = await _client.query(
        QueryOptions(
          document: gql(GqlQuery.episodesQuery),
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
      final _episodeResponse = result.data!['episodes'] as Map?;
      final _episodeResults = _episodeResponse?['results'];

      return Right(Episode.fromJsonList(_episodeResults) ?? []);
    } on Exception catch (exception) {
      safePrint(exception.toString());
      return Left(ServerFailure());
    }
  }
}
