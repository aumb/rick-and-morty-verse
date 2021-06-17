import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_verse/core/models/location/location.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tLocationModel = RMLocation(
    id: '1',
    name: 'Earth (C-137)',
    url: 'https://rickandmortyapi.com/api/location/1',
    created: DateTime.tryParse('2017-11-10T12:42:04.162Z'),
    residents: [],
    dimension: 'Dimension C-137',
    type: 'Planet',
    image: null,
  );

  final tLocationList = List.generate(3, (index) => tLocationModel);

  group('fromJson', () {
    test(
      'should return a valid model when the JSON obj is returned',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('location.json'));
        // act
        final result = RMLocation.fromJson(jsonMap);
        // assert
        expect(result, tLocationModel);
      },
    );
  });

  group('fromJsonList', () {
    test(
      'should return a valid model list when the JSON list is returned',
      () async {
        // arrange
        final List jsonList = json.decode(fixture('locations.json'));
        // act
        final result = RMLocation.fromJsonList(jsonList);
        // assert
        expect(result, tLocationList);
      },
    );
  });
}
