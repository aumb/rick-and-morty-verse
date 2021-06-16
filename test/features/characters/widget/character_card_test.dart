import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';
import 'package:rick_and_morty_verse/core/models/episode/episode.dart';
import 'package:rick_and_morty_verse/features/characters/widgets/character_card.dart';
import 'package:rick_and_morty_verse/features/characters/widgets/character_status_widget.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../helpers/helpers.dart';

void main() {
  var character = Character.fromJson(
    json.decode(
      fixture('character.json'),
    ),
  );

  setUp(() {
    character = character.copyWith(
      episode: Episode.fromJsonList(
        json.decode(
          fixture('episodes.json'),
        ),
      ),
    );
  });

  Future<void> setupCard(WidgetTester tester) async {
    await tester.pumpApp(
      CharacterCard(character: character),
    );
  }

  group('CharacterCard', () {
    testWidgets('renders episode name', (tester) async {
      await setupCard(tester);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('episode_name')), findsOneWidget);
    });

    testWidgets('renders location name', (tester) async {
      await setupCard(tester);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('location_name')), findsOneWidget);
    });

    testWidgets('renders species name', (tester) async {
      await setupCard(tester);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('species_name')), findsOneWidget);
    });

    testWidgets('renders location name', (tester) async {
      await setupCard(tester);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('location_name')), findsOneWidget);
    });

    testWidgets('renders CharacterStatusWidget name', (tester) async {
      await setupCard(tester);
      await tester.pumpAndSettle();

      expect(find.byType(CharacterStatusWidget), findsOneWidget);
    });
  });
}
