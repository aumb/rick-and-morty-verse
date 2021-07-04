import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_verse/components/search_bar.dart';
import 'package:rick_and_morty_verse/core/cubits/search/search_cubit.dart';
import '../../../helpers/helpers.dart';

class MockSearchCubit extends Mock implements SearchCubit {}

void main() {
  late MockSearchCubit mockSearchCubit;

  setUp(() {
    mockSearchCubit = MockSearchCubit();
  });

  Future<void> setupSearchBar(WidgetTester tester) async {
    await tester.pumpApp(BlocProvider<SearchCubit>(
      create: (_) => mockSearchCubit,
      child: SearchBar(),
    ));
  }

  group('Search Bar', () {
    testWidgets('renders back button', (WidgetTester tester) async {
      await setupSearchBar(tester);
      await tester.pumpAndSettle();
      expect(find.byType(BackButtonIcon), findsOneWidget);
    });
  });

  testWidgets('renders text field', (WidgetTester tester) async {
    await setupSearchBar(tester);
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('renders text field', (WidgetTester tester) async {
    await setupSearchBar(tester);
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('renders clear button', (WidgetTester tester) async {
    await setupSearchBar(tester);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('clear_button')), findsOneWidget);
  });

  testWidgets('renders back button', (WidgetTester tester) async {
    await setupSearchBar(tester);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('back_button')), findsOneWidget);
  });

  testWidgets('does not render SearchBar when back button is pressed',
      (WidgetTester tester) async {
    await setupSearchBar(tester);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('back_button')));
    await tester.pumpAndSettle();
    expect(find.byElementType(SearchBar), findsNothing);
  });

  testWidgets('Calls get all data from cubit', (WidgetTester tester) async {
    const query = 'test';

    when(() => mockSearchCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([const SearchState.loaded()]),
    );

    when(() => mockSearchCubit.close()).thenAnswer(
      (_) async {},
    );

    await setupSearchBar(tester);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), query);
    await tester.testTextInput.receiveAction(TextInputAction.done);

    verify(() => mockSearchCubit.getAllResults()).called(1);
  });
}
