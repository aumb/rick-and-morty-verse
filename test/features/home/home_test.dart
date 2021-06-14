import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_verse/components/empty_page.dart';
import 'package:rick_and_morty_verse/core/blocs/home/home_bloc.dart';
import 'package:rick_and_morty_verse/core/cubits/theme/theme_cubit.dart';
import 'package:rick_and_morty_verse/features/characters/characters_page.dart';
import 'package:rick_and_morty_verse/features/episodes/episodes_page.dart';
import 'package:rick_and_morty_verse/features/home/home_page.dart';
import 'package:rick_and_morty_verse/features/locations/locations_page.dart';
import 'package:rick_and_morty_verse/features/settings/settings_page.dart';

import '../../helpers/helpers.dart';

class HomeStateFake extends Fake implements HomeState {}

class HomeEventFake extends Fake implements HomeEvent {}

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  group('Home', () {
    late HomeBloc homeBloc;

    Future<void> setUpHomeView(WidgetTester tester) async {
      await tester.pumpApp(MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => homeBloc,
          ),
          BlocProvider(
            create: (context) => ThemeCubit(),
          )
        ],
        child: const HomeView(),
      ));
      await tester.pumpAndSettle();
    }

    setUp(() {
      initHydratedBloc();
      registerFallbackValue<HomeState>(HomeStateFake());
      registerFallbackValue<HomeEvent>(HomeEventFake());
      homeBloc = MockHomeBloc();
    });

    tearDown(() {
      homeBloc.close();
    });

    testWidgets('renders HomeView', (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.pumpAndSettle();
      expect(find.byType(HomeView), findsOneWidget);
    });

    testWidgets(
      'renders CharactersPage when index is 0',
      (tester) async {
        when(() => homeBloc.state).thenAnswer(
            (invocation) => const HomeState.navigationScreenChanged(0));
        await setUpHomeView(tester);
        expect(find.byType(CharactersPage), findsOneWidget);
      },
    );

    testWidgets(
      'renders EpisodesPage when index is 1',
      (tester) async {
        when(() => homeBloc.state).thenAnswer(
            (invocation) => const HomeState.navigationScreenChanged(1));
        await setUpHomeView(tester);
        expect(find.byType(EpisodesPage), findsOneWidget);
      },
    );
    testWidgets(
      'renders LocationsPage when index is 2',
      (tester) async {
        when(() => homeBloc.state).thenAnswer(
            (invocation) => const HomeState.navigationScreenChanged(2));
        await setUpHomeView(tester);
        expect(find.byType(LocationsPage), findsOneWidget);
      },
    );

    testWidgets(
      'renders SettingsPage when index is 3',
      (tester) async {
        when(() => homeBloc.state).thenAnswer(
            (invocation) => const HomeState.navigationScreenChanged(3));
        await setUpHomeView(tester);
        expect(find.byType(SettingsPage), findsOneWidget);
      },
    );

    testWidgets(
      'renders EmptyPage when index is 4',
      (tester) async {
        when(() => homeBloc.state).thenAnswer(
            (invocation) => const HomeState.navigationScreenChanged(4));
        await setUpHomeView(tester);
        expect(find.byType(EmptyPage), findsOneWidget);
      },
    );

    testWidgets(
      'Changes selectedIndex when tapped',
      (tester) async {
        when(() => homeBloc.state).thenAnswer(
            (invocation) => const HomeState.navigationScreenChanged(0));
        await setUpHomeView(tester);
        await tester.tap(
          find.byKey(const Key('characters_icon_button')),
        );
        await tester.pumpAndSettle();
        expect(homeBloc.state.selectedIndex, equals(0));
      },
    );
  });
}
