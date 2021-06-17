import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_verse/core/models/location/location.dart';
import 'package:rick_and_morty_verse/features/locations/widgets/location_card.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../helpers/helpers.dart';

void main() {
  var location = RMLocation.fromJson(
    json.decode(
      fixture('location.json'),
    ),
  );

  Future<void> setupCard(WidgetTester tester) async {
    await tester.pumpApp(
      LocationCard(location: location),
    );
  }

  group('LocationCard', () {
    testWidgets('renders location name', (tester) async {
      await setupCard(tester);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('location_name')), findsOneWidget);
    });

    testWidgets('renders location type', (tester) async {
      await setupCard(tester);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('location_type')), findsOneWidget);
    });

    testWidgets('renders location dimension', (tester) async {
      await setupCard(tester);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('location_dimension')), findsOneWidget);
    });
  });
}
