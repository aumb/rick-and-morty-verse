import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_verse/core/models/failure.dart';
import 'package:rick_and_morty_verse/core/models/location/location.dart';
import 'package:rick_and_morty_verse/core/repositories/locations_repository.dart';

import '../../fixtures/fixture_reader.dart';

class MockGraphQlClient extends Mock implements GraphQLClient {}

class QueryOptionsFake extends Fake implements QueryOptions {}

void main() {
  late RMLocationsRepository repository;
  late MockGraphQlClient mockGraphQlClient;

  final tLocations =
      RMLocation.fromJsonList(jsonDecode(fixture('locations.json')));

  setUpAll(() {
    registerFallbackValue(QueryOptionsFake());
  });

  setUp(() {
    mockGraphQlClient = MockGraphQlClient();
    repository = RMLocationsRepository(mockGraphQlClient);
  });

  void setupSuccessResponse() {
    when(() => mockGraphQlClient.query(any())).thenAnswer(
      (_) async => QueryResult(
        source: QueryResultSource.network,
        data: jsonDecode(fixture('locations_pagination.json')),
      ),
    );
  }

  void setupNullResponse() {
    when(() => mockGraphQlClient.query(any())).thenAnswer(
      (_) async => QueryResult(
        source: QueryResultSource.network,
        data: null,
      ),
    );
  }

  void setupErrorResponse() {
    when(() => mockGraphQlClient.query(any())).thenThrow(Exception());
  }

  group('getEpisodes', () {
    test('should return a list of locations if response is successfull',
        () async {
      setupSuccessResponse();

      final result = await repository.getLocations(1);

      final foldedList = [];

      result.fold((l) => null, foldedList.addAll);

      expect(foldedList, equals(tLocations));
    });

    test('should return an empty list if data is null', () async {
      setupNullResponse();

      final result = await repository.getLocations(1);

      final foldedList = [];

      result.fold((l) => null, foldedList.addAll);

      expect(foldedList, equals([]));
    });

    test('should return a server failure if response is an error', () async {
      setupErrorResponse();
      dynamic failure;

      final result = await repository.getLocations(1);

      result.fold((l) => failure = l, (r) => null);

      expect(failure, isA<ServerFailure>());
    });
  });
}
