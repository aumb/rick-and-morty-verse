import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rick_and_morty_verse/core/models/episode/episode.dart';
import 'package:rick_and_morty_verse/features/episodes/widets/episode_card.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../helpers/helpers.dart';

void main() {
  var episode = Episode.fromJson(
    json.decode(
      fixture('episode.json'),
    ),
  );

  Future<void> setupCard(WidgetTester tester) async {
    await tester.pumpApp(
      EpisodeCard(episode: episode),
    );
  }

  group('EpisodeCard', () {
    testWidgets('renders episode name', (tester) async {
      await setupCard(tester);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('episode_name')), findsOneWidget);
    });

    testWidgets('renders episode season number name', (tester) async {
      await setupCard(tester);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('episode_season_number')), findsOneWidget);
    });

    testWidgets('renders air date', (tester) async {
      await setupCard(tester);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('air_date')), findsOneWidget);
    });
  });
}
