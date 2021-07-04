import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_verse/features/search/widgets/search_result_list.dart';

import '../../../helpers/helpers.dart';

void main() {
  final items = List.generate(20, (index) => 'test$index');

  Future<void> setupList(
    WidgetTester tester, {
    bool isInitial = false,
    bool isLoading = false,
    bool isEmpty = false,
    bool isLoadingMore = false,
  }) async {
    await tester.pumpApp(SearchResultList<String>(
      controller: ScrollController(),
      isInitial: isInitial,
      isLoading: isLoading,
      isEmpty: isEmpty,
      isLoadingMore: isLoadingMore,
      items: items,
      itemBuilder: (item) => Text(item ?? ''),
      hintText: 'hint',
      emptyText: 'empty',
    ));
  }

  group('SearchResultList', () {
    testWidgets('renders hintText if isInitial is true', (tester) async {
      await setupList(tester, isInitial: true);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('hint_text')), findsOneWidget);
    });

    testWidgets('renders emptyText if isEmpty is true', (tester) async {
      await setupList(tester, isEmpty: true);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('empty_text')), findsOneWidget);
    });

    testWidgets('renders Circular progress indicator if isLoadingMore is true',
        (tester) async {
      await setupList(tester, isLoadingMore: true);
      await tester.pumpAndSettle();
      final gesture = await tester.startGesture(Offset.zero);
      await gesture.moveBy(const Offset(0, -1500));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
