import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_verse/core/blocs/rm_locations/rm_locations_bloc.dart';
import 'package:rick_and_morty_verse/core/models/location/location.dart';
import 'package:rick_and_morty_verse/core/repositories/locations_repository.dart';

import '../../fixtures/fixture_reader.dart';

class MockRMLocationsRepository extends Mock implements RMLocationsRepository {}

void main() {
  late RMLocationsBloc bloc;
  late MockRMLocationsRepository mockRMLocationsRepository;

  final tRMLocations =
      RMLocation.fromJsonList(json.decode(fixture('locations.json'))) ?? [];

  setUp(() {
    mockRMLocationsRepository = MockRMLocationsRepository();
    bloc = RMLocationsBloc(mockRMLocationsRepository);
  });

  void setUpSuccessfullResponse() {
    when(() => mockRMLocationsRepository.getLocations(any()))
        .thenAnswer((_) async => Right(tRMLocations));
  }

  tearDown(() {
    bloc.close();
  });

  group('RMLocationsBloc', () {
    test('initial state is RMLocationsState.initial()', () {
      expect(bloc.state, equals(const RMLocationsState.initial()));
    });

    group('RMLocationsEvent.getRMLocations', () {
      blocTest<RMLocationsBloc, RMLocationsState>(
        '''emits RMLocationsState.loaded() when event is called for 
        the first time''',
        build: () {
          setUpSuccessfullResponse();
          return bloc;
        },
        act: (_) => bloc.add(
          const RMLocationsEvent.getLocations(),
        ),
        expect: () {
          expect(bloc.locations.length, equals(tRMLocations.length));
          return [const RMLocationsState.loaded()];
        },
      );

      blocTest<RMLocationsBloc, RMLocationsState>(
        '''emits RMLocationsState.loading() RMLocationsState.loaded() when 
        event is called first time''',
        build: () {
          setUpSuccessfullResponse();
          bloc.emit(const RMLocationsState.loaded());
          return bloc;
        },
        act: (_) => bloc.add(
          const RMLocationsEvent.getLocations(),
        ),
        expect: () {
          expect(bloc.locations.length, equals(tRMLocations.length));
          return [
            const RMLocationsState.loading(),
            const RMLocationsState.loaded()
          ];
        },
      );

      blocTest<RMLocationsBloc, RMLocationsState>(
        '''should change canGetMore to false when list is empty''',
        build: () {
          when(() => mockRMLocationsRepository.getLocations(any()))
              .thenAnswer((_) async => const Right([]));
          bloc.emit(const RMLocationsState.loaded());
          return bloc;
        },
        act: (_) => bloc.add(
          const RMLocationsEvent.getLocations(),
        ),
        expect: () {
          expect(bloc.locations.length, equals(0));
          expect(bloc.canGetMore, equals(false));
          return [
            const RMLocationsState.loading(),
            const RMLocationsState.loaded()
          ];
        },
      );
    });
  });
}
