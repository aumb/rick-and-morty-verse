import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_verse/core/blocs/characters/characters_bloc.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';

import 'package:rick_and_morty_verse/core/repositories/characters_repository.dart';
import 'package:rick_and_morty_verse/features/characters/characters_page.dart';
import 'package:rick_and_morty_verse/features/characters/widgets/character_card.dart';

import '../../fixtures/fixture_reader.dart';
import '../../helpers/helpers.dart';

class MockCharactersRepository extends Mock implements CharactersRepository {}

class CharactersStateFake extends Fake implements CharactersState {}

class CharactersEventFake extends Fake implements CharactersEvent {}

class MockCharactersBloc extends MockBloc<CharactersEvent, CharactersState>
    implements CharactersBloc {}

void main() {
  group('Characters', () {
    late CharactersBloc mockCharactersBloc;
    late MockCharactersRepository mockCharactersRepository;

    var tCharacters =
        Character.fromJsonList(json.decode(fixture('characters.json'))) ?? [];

    setUp(() {
      initHydratedBloc();
      registerFallbackValue(CharactersStateFake());
      registerFallbackValue(CharactersEventFake());
      mockCharactersBloc = MockCharactersBloc();
      mockCharactersRepository = MockCharactersRepository();
    });

    tearDown(() {
      mockCharactersBloc.close();
    });

    void setupEmptyList() {
      when(() => mockCharactersRepository.getCharacters(any()))
          .thenAnswer((_) async => const Right([]));
    }

    Future<void> setupCharactersView(WidgetTester tester) async {
      await tester.pumpApp(BlocProvider<CharactersBloc>(
        create: (_) => mockCharactersBloc,
        child: const CharactersView(),
      ));
    }

    testWidgets('renders CharactersView', (tester) async {
      setupEmptyList();
      await tester.pumpApp(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider<CharactersRepository>(
              create: (_) => mockCharactersRepository,
            ),
          ],
          child: const CharactersPage(),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(CharactersView), findsOneWidget);
    });

    group('CharactersView', () {
      testWidgets('renders a CircularProgresIndicator if state is initial',
          (tester) async {
        when(() => mockCharactersBloc.state)
            .thenReturn(const CharactersState.initial());
        when((() => mockCharactersBloc.characters)).thenReturn([]);
        await setupCharactersView(tester);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
      testWidgets('renders a CircularProgresIndicator if state is loading',
          (tester) async {
        when(() => mockCharactersBloc.state)
            .thenReturn(const CharactersState.loading());
        when(() => mockCharactersBloc.canGetMore).thenReturn(true);
        when((() => mockCharactersBloc.characters)).thenReturn(tCharacters);
        await setupCharactersView(tester);

        final gesture = await tester
            .startGesture(const Offset(0, 300)); //Position of the scrollview
        await gesture.moveBy(const Offset(0, -300));
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
      testWidgets('renders 3 CharacterCard if state is loaded', (tester) async {
        when(() => mockCharactersBloc.canGetMore).thenReturn(false);
        when(() => mockCharactersBloc.state)
            .thenReturn(const CharactersState.loaded());
        when((() => mockCharactersBloc.characters)).thenReturn(tCharacters);
        await setupCharactersView(tester);

        final gesture = await tester
            .startGesture(const Offset(0, 300)); //Position of the scrollview
        await gesture.moveBy(const Offset(0, -300));
        await tester.pump();
        expect(find.byType(CharacterCard), findsNWidgets(3));
      });
    });
  });
}
