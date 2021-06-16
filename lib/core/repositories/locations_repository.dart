import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_verse/core/models/failure.dart';
import 'package:rick_and_morty_verse/core/models/location/location.dart';
import 'package:rick_and_morty_verse/core/utils/gql_query.dart';
import 'package:rick_and_morty_verse/core/utils/safe_print.dart';

abstract class RMLocationsRepositoryContract {
  Future<Either<Failure, List<RMLocation?>>> getLocations(int page);
}

class RMLocationsRepository implements RMLocationsRepositoryContract {
  const RMLocationsRepository(this._client);

  final GraphQLClient _client;

  @override
  Future<Either<Failure, List<RMLocation?>>> getLocations(int page) async {
    try {
      final result = await _client.query(
        QueryOptions(
          document: gql(GqlQuery.locationsQuery),
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
      final _locationResponse = result.data?['locations'] as Map?;
      final _locationResults = _locationResponse?['results'];

      return Right(RMLocation.fromJsonList(_locationResults) ?? []);
    } on Exception catch (exception) {
      safePrint(exception.toString());
      return Left(ServerFailure());
    }
  }
}
