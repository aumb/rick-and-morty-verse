import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_verse/core/enums/character_status_enum.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';
import 'package:rick_and_morty_verse/features/characters/widgets/character_status_widget.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../helpers/helpers.dart';

void main() {
  var character = Character.fromJson(
    json.decode(
      fixture('character.json'),
    ),
  );

  Future<void> setupCard(WidgetTester tester) async {
    await tester.pumpApp(
      CharacterStatusWidget(character: character),
    );
  }

  group('CharacterStatusWidget', () {
    group('Indicator Color', () {
      const valueKey = ValueKey('status_indicator');
      testWidgets('renders red if status is dead', (tester) async {
        character = character.copyWith(status: CharacterStatusEnum.dead);
        await setupCard(tester);
        await tester.pumpAndSettle();
        expect(
            ((tester.firstWidget(find.byKey(valueKey)) as Container).decoration
                    as BoxDecoration)
                .color,
            Colors.red);
      });

      testWidgets('renders green if status is alive', (tester) async {
        character = character.copyWith(status: CharacterStatusEnum.alive);
        await setupCard(tester);
        await tester.pumpAndSettle();
        expect(
            ((tester.firstWidget(find.byKey(valueKey)) as Container).decoration
                    as BoxDecoration)
                .color,
            Colors.green);
      });

      testWidgets('renders grey if status is unknown', (tester) async {
        character = character.copyWith(status: CharacterStatusEnum.unknown);
        await setupCard(tester);
        await tester.pumpAndSettle();
        expect(
            ((tester.firstWidget(find.byKey(valueKey)) as Container).decoration
                    as BoxDecoration)
                .color,
            Colors.grey);
      });
    });

    group('Status Text', () {
      const valueKey = ValueKey('status_text');
      testWidgets('renders Dead if status is dead', (tester) async {
        character = character.copyWith(status: CharacterStatusEnum.dead);
        await setupCard(tester);
        await tester.pumpAndSettle();
        expect(
            ((tester.firstWidget(find.byKey(valueKey)) as Text).data), 'Dead');
      });

      testWidgets('renders Alive if status is alive', (tester) async {
        character = character.copyWith(status: CharacterStatusEnum.alive);
        await setupCard(tester);
        await tester.pumpAndSettle();
        expect(
            ((tester.firstWidget(find.byKey(valueKey)) as Text).data), 'Alive');
      });

      testWidgets('renders Unknown if status is unknown', (tester) async {
        character = character.copyWith(status: CharacterStatusEnum.unknown);
        await setupCard(tester);
        await tester.pumpAndSettle();
        expect(((tester.firstWidget(find.byKey(valueKey)) as Text).data),
            'Unknown');
      });

      testWidgets('renders Unknown if status is null', (tester) async {
        character = character.copyWith(status: null);
        await setupCard(tester);
        await tester.pumpAndSettle();
        expect(((tester.firstWidget(find.byKey(valueKey)) as Text).data),
            'Unknown');
      });
    });
  });
}
