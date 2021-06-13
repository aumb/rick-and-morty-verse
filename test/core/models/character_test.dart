import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_verse/core/enums/character_status_enum.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';
import 'package:rick_and_morty_verse/core/models/location/location.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tCharacterModel = Character(
    id: 38,
    name: 'Beth Smith',
    status: CharacterStatusEnum.alive,
    species: 'Human',
    type: '',
    gender: 'Female',
    origin: const RMLocation(
      name: 'Earth (C-137)',
      url: 'https://rickandmortyapi.com/api/location/1',
      id: null,
      type: null,
      residents: null,
      dimension: null,
      created: null,
    ),
    location: const RMLocation(
      name: 'Earth (C-137)',
      url: 'https://rickandmortyapi.com/api/location/1',
      id: null,
      type: null,
      residents: null,
      dimension: null,
      created: null,
    ),
    image: 'https://rickandmortyapi.com/api/character/avatar/38.jpeg',
    url: 'https://rickandmortyapi.com/api/character/38',
    created: DateTime.tryParse('2017-11-05T09:48:44.230Z'),
    episode: [],
  );

  final tCharacterList = List.generate(3, (index) => tCharacterModel);

  group('fromJson', () {
    test(
      'should return a valid model when the JSON obj is returned',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('character.json'));
        // act
        final result = Character.fromJson(jsonMap);
        // assert
        expect(result, tCharacterModel);
      },
    );
  });

  group('fromJsonList', () {
    test(
      'should return a valid model list when the JSON list is returned',
      () async {
        // arrange
        final List jsonList = json.decode(fixture('characters.json'));
        // act
        final result = Character.fromJsonList(jsonList);
        // assert
        expect(result, tCharacterList);
      },
    );
  });
}
