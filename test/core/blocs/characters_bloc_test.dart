import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_verse/core/blocs/characters/characters_bloc.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';
import 'package:rick_and_morty_verse/core/repositories/characters_repository.dart';

import '../../fixtures/fixture_reader.dart';

class MockCharactersRepository extends Mock implements CharactersRepository {}

void main() {
  late CharactersBloc bloc;
  late MockCharactersRepository mockCharactersRepository;

  final tCharacters =
      Character.fromJsonList(json.decode(fixture('characters.json'))) ?? [];

  setUp(() {
    mockCharactersRepository = MockCharactersRepository();
    bloc = CharactersBloc(mockCharactersRepository);
  });

  void setUpSuccessfullResponse() {
    when(() => mockCharactersRepository.getCharacters(any()))
        .thenAnswer((_) async => Right(tCharacters));
  }

  tearDown(() {
    bloc.close();
  });

  group('CharactersBloc', () {
    test('initial state is CharactersState.initial()', () {
      expect(bloc.state, equals(const CharactersState.initial()));
    });

    group('CharactersEvent.getCharacters', () {
      blocTest<CharactersBloc, CharactersState>(
        '''emits CharactersState.loaded() when event is called for 
        the first time''',
        build: () {
          setUpSuccessfullResponse();
          return bloc;
        },
        act: (_) => bloc.add(
          const CharactersEvent.getCharacters(),
        ),
        expect: () {
          expect(bloc.characters.length, equals(tCharacters.length));
          return [const CharactersState.loaded()];
        },
      );

      blocTest<CharactersBloc, CharactersState>(
        '''emits CharactersState.loading() CharactersState.loaded() when 
        event is called first time''',
        build: () {
          setUpSuccessfullResponse();
          bloc.emit(const CharactersState.loaded());
          return bloc;
        },
        act: (_) => bloc.add(
          const CharactersEvent.getCharacters(),
        ),
        expect: () {
          expect(bloc.characters.length, equals(tCharacters.length));
          return [
            const CharactersState.loading(),
            const CharactersState.loaded()
          ];
        },
      );

      blocTest<CharactersBloc, CharactersState>(
        '''should change canGetMore to false when list is empty''',
        build: () {
          when(() => mockCharactersRepository.getCharacters(any()))
              .thenAnswer((_) async => const Right([]));
          bloc.emit(const CharactersState.loaded());
          return bloc;
        },
        act: (_) => bloc.add(
          const CharactersEvent.getCharacters(),
        ),
        expect: () {
          expect(bloc.characters.length, equals(0));
          expect(bloc.canGetMore, equals(false));
          return [
            const CharactersState.loading(),
            const CharactersState.loaded()
          ];
        },
      );
    });
  });
}
