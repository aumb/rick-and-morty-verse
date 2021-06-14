import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_verse/features/home/widgets/custom_nav_bar.dart';
import 'package:rick_and_morty_verse/features/search/search_page.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('CustomNavBar', () {
    testWidgets('renders SearchPage when FAB is pressed', (tester) async {
      await tester.pumpApp(
        Scaffold(
          body: CustomNavBar(
            index: 0,
            onTabChange: (index) => null,
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.byType(SearchPage), findsOneWidget);
    });

    group('IconButtons', () {
      testWidgets('emits a value of 0 when pressed', (tester) async {
        int? indx;

        await tester.pumpApp(
          Scaffold(
            body: CustomNavBar(
              index: 0,
              onTabChange: (index) {
                indx = index;
              },
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('characters_icon_button')));
        await tester.pumpAndSettle();
        expect(indx, equals(0));
      });

      testWidgets('emits a value of 1 when pressed', (tester) async {
        int? indx;

        await tester.pumpApp(
          Scaffold(
            body: CustomNavBar(
              index: 0,
              onTabChange: (index) {
                indx = index;
              },
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('episodes_icon_button')));
        await tester.pumpAndSettle();
        expect(indx, equals(1));
      });

      testWidgets('emits a value of 2 when pressed', (tester) async {
        int? indx;

        await tester.pumpApp(
          Scaffold(
            body: CustomNavBar(
              index: 0,
              onTabChange: (index) {
                indx = index;
              },
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('locations_icon_button')));
        await tester.pumpAndSettle();
        expect(indx, equals(2));
      });

      testWidgets('emits a value of 3 when pressed', (tester) async {
        int? indx;

        await tester.pumpApp(
          Scaffold(
            body: CustomNavBar(
              index: 0,
              onTabChange: (index) {
                indx = index;
              },
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('settings_icon_button')));
        await tester.pumpAndSettle();
        expect(indx, equals(3));
      });
    });
  });
}
