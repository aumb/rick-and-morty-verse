import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_verse/core/enums/character_status_enum.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';
import 'package:rick_and_morty_verse/core/models/episode/episode.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tEpisodeModel = Episode(
    id: '1',
    name: 'Pilot',
    airDate: 'December 2, 2013',
    episode: 'S01E01',
    characters: [
      const Character(
        id: null,
        name: null,
        type: null,
        gender: null,
        origin: null,
        location: null,
        image: null,
        episode: null,
        species: null,
        status: CharacterStatusEnum.unknown,
        url: 'https://rickandmortyapi.com/api/character/1',
        created: null,
      )
    ],
    url: 'https://rickandmortyapi.com/api/episode/1',
    created: DateTime.tryParse('2017-11-10T12:56:33.798Z'),
    image: null,
  );

  final tEpisodeList = List.generate(3, (index) => tEpisodeModel);

  group('fromJson', () {
    test(
      'should return a valid model when the JSON obj is returned',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('episode.json'));
        // act
        final result = Episode.fromJson(jsonMap);
        // assert
        expect(result, tEpisodeModel);
      },
    );
  });

  group('fromJsonList', () {
    test(
      'should return a valid model list when the JSON list is returned',
      () async {
        // arrange
        final List jsonList = json.decode(fixture('episodes.json'));
        // act
        final result = Episode.fromJsonList(jsonList);
        // assert
        expect(result, tEpisodeList);
      },
    );
  });
}
