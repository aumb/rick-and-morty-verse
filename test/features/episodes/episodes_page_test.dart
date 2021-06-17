import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_verse/core/blocs/episodes/episodes_bloc.dart';
import 'package:rick_and_morty_verse/core/models/episode/episode.dart';
import 'package:rick_and_morty_verse/core/repositories/episodes_repository.dart';
import 'package:rick_and_morty_verse/features/episodes/episodes_page.dart';
import 'package:rick_and_morty_verse/features/episodes/widets/episode_card.dart';

import '../../fixtures/fixture_reader.dart';
import '../../helpers/helpers.dart';

class MockEpisodesRepository extends Mock implements EpisodesRepository {}

class EpisodesStateFake extends Fake implements EpisodesState {}

class EpisodesEventFake extends Fake implements EpisodesEvent {}

class MockEpisodesBloc extends MockBloc<EpisodesEvent, EpisodesState>
    implements EpisodesBloc {}

void main() {
  group('Episodes', () {
    late EpisodesBloc mockEpisodesBloc;
    late MockEpisodesRepository mockEpisodesRepository;

    var tEpisodes =
        Episode.fromJsonList(json.decode(fixture('episodes.json'))) ?? [];

    setUp(() {
      initHydratedBloc();
      registerFallbackValue(EpisodesStateFake());
      registerFallbackValue(EpisodesEventFake());
      mockEpisodesBloc = MockEpisodesBloc();
      mockEpisodesRepository = MockEpisodesRepository();
    });

    tearDown(() {
      mockEpisodesBloc.close();
    });

    void setupEmptyList() {
      when(() => mockEpisodesRepository.getEpisodes(any()))
          .thenAnswer((_) async => const Right([]));
    }

    Future<void> setupEpisodesView(WidgetTester tester) async {
      await tester.pumpApp(BlocProvider<EpisodesBloc>(
        create: (_) => mockEpisodesBloc,
        child: const EpisodesView(),
      ));
    }

    testWidgets('renders EpisodesView', (tester) async {
      setupEmptyList();
      await tester.pumpApp(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider<EpisodesRepository>(
              create: (_) => mockEpisodesRepository,
            ),
          ],
          child: const EpisodesPage(),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(EpisodesView), findsOneWidget);
    });

    group('EpisodesView', () {
      testWidgets('renders a CircularProgresIndicator if state is initial',
          (tester) async {
        when(() => mockEpisodesBloc.state)
            .thenReturn(const EpisodesState.initial());
        when((() => mockEpisodesBloc.episodes)).thenReturn([]);
        await setupEpisodesView(tester);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
      testWidgets('renders a CircularProgresIndicator if state is loading',
          (tester) async {
        when(() => mockEpisodesBloc.state)
            .thenReturn(const EpisodesState.loading());
        when(() => mockEpisodesBloc.canGetMore).thenReturn(true);
        when((() => mockEpisodesBloc.episodes)).thenReturn(tEpisodes);
        await setupEpisodesView(tester);
        final gesture = await tester.startGesture(Offset.zero);
        await gesture.moveBy(const Offset(0, -500));
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
      testWidgets('renders 3 EpisodeCard if state is loaded', (tester) async {
        when(() => mockEpisodesBloc.canGetMore).thenReturn(false);
        when(() => mockEpisodesBloc.state)
            .thenReturn(const EpisodesState.loaded());
        when((() => mockEpisodesBloc.episodes)).thenReturn(tEpisodes);
        await setupEpisodesView(tester);

        final gesture = await tester.startGesture(const Offset(0.0, 100.0));
        await gesture.moveBy(const Offset(0.0, -400.0));
        await tester.pump();
        expect(find.byType(EpisodeCard), findsNWidgets(3));
      });
    });
  });
}
