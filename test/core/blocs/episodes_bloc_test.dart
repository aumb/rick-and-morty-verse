import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_verse/core/blocs/episodes/episodes_bloc.dart';
import 'package:rick_and_morty_verse/core/models/episode/episode.dart';
import 'package:rick_and_morty_verse/core/repositories/episodes_repository.dart';

import '../../fixtures/fixture_reader.dart';

class MockEpisodesRepository extends Mock implements EpisodesRepository {}

void main() {
  late EpisodesBloc bloc;
  late MockEpisodesRepository mockEpisodesRepository;

  final tEpisodes =
      Episode.fromJsonList(json.decode(fixture('episodes.json'))) ?? [];

  setUp(() {
    mockEpisodesRepository = MockEpisodesRepository();
    bloc = EpisodesBloc(mockEpisodesRepository);
  });

  void setUpSuccessfullResponse() {
    when(() => mockEpisodesRepository.getEpisodes(any()))
        .thenAnswer((_) async => Right(tEpisodes));
  }

  tearDown(() {
    bloc.close();
  });

  group('EpisodesBloc', () {
    test('initial state is EpisodesState.initial()', () {
      expect(bloc.state, equals(const EpisodesState.initial()));
    });

    group('EpisodesEvent.getEpisodes', () {
      blocTest<EpisodesBloc, EpisodesState>(
        '''emits EpisodesState.loaded() when event is called for 
        the first time''',
        build: () {
          setUpSuccessfullResponse();
          return bloc;
        },
        act: (_) => bloc.add(
          const EpisodesEvent.getEpisodes(),
        ),
        expect: () {
          expect(bloc.episodes.length, equals(tEpisodes.length));
          return [const EpisodesState.loaded()];
        },
      );

      blocTest<EpisodesBloc, EpisodesState>(
        '''emits EpisodesState.loading() EpisodesState.loaded() when 
        event is called first time''',
        build: () {
          setUpSuccessfullResponse();
          bloc.emit(const EpisodesState.loaded());
          return bloc;
        },
        act: (_) => bloc.add(
          const EpisodesEvent.getEpisodes(),
        ),
        expect: () {
          expect(bloc.episodes.length, equals(tEpisodes.length));
          return [const EpisodesState.loading(), const EpisodesState.loaded()];
        },
      );

      blocTest<EpisodesBloc, EpisodesState>(
        '''should change canGetMore to false when list is empty''',
        build: () {
          when(() => mockEpisodesRepository.getEpisodes(any()))
              .thenAnswer((_) async => const Right([]));
          bloc.emit(const EpisodesState.loaded());
          return bloc;
        },
        act: (_) => bloc.add(
          const EpisodesEvent.getEpisodes(),
        ),
        expect: () {
          expect(bloc.episodes.length, equals(0));
          expect(bloc.canGetMore, equals(false));
          return [const EpisodesState.loading(), const EpisodesState.loaded()];
        },
      );
    });
  });
}
