import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_verse/components/empty_page.dart';
import 'package:rick_and_morty_verse/core/blocs/home/home_bloc.dart';
import 'package:rick_and_morty_verse/core/cubits/theme/theme_cubit.dart';
import 'package:rick_and_morty_verse/core/repositories/characters_repository.dart';
import 'package:rick_and_morty_verse/core/repositories/episodes_repository.dart';
import 'package:rick_and_morty_verse/core/repositories/locations_repository.dart';
import 'package:rick_and_morty_verse/features/characters/characters_page.dart';
import 'package:rick_and_morty_verse/features/episodes/episodes_page.dart';
import 'package:rick_and_morty_verse/features/home/home_page.dart';
import 'package:rick_and_morty_verse/features/locations/locations_page.dart';
import 'package:rick_and_morty_verse/features/settings/settings_page.dart';

import '../../helpers/helpers.dart';

class HomeStateFake extends Fake implements HomeState {}

class HomeEventFake extends Fake implements HomeEvent {}

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

class MockCharactersRepository extends Mock implements CharactersRepository {}

class MockEpisodesRepository extends Mock implements EpisodesRepository {}

class MockRMLocationsRepository extends Mock implements RMLocationsRepository {}

void main() {
  group('Home', () {
    late HomeBloc homeBloc;
    late MockCharactersRepository mockCharactersRepository;
    late MockEpisodesRepository mockEpisodesRepository;
    late MockRMLocationsRepository mockRMLocationsRepository;

    setUp(() {
      initHydratedBloc();
      registerFallbackValue<HomeState>(HomeStateFake());
      registerFallbackValue<HomeEvent>(HomeEventFake());
      homeBloc = MockHomeBloc();
      mockCharactersRepository = MockCharactersRepository();
      mockEpisodesRepository = MockEpisodesRepository();
      mockRMLocationsRepository = MockRMLocationsRepository();
    });

    tearDown(() {
      homeBloc.close();
    });

    Future<void> setUpHomeView(WidgetTester tester) async {
      await tester.pumpApp(MultiRepositoryProvider(
        providers: [
          RepositoryProvider<CharactersRepository>(
              create: (context) => mockCharactersRepository),
          RepositoryProvider<EpisodesRepository>(
              create: (context) => mockEpisodesRepository),
          RepositoryProvider<RMLocationsRepository>(
              create: (context) => mockRMLocationsRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => homeBloc,
            ),
            BlocProvider(
              create: (context) => ThemeCubit(),
            )
          ],
          child: const HomeView(),
        ),
      ));
      await tester.pumpAndSettle();
    }

    testWidgets('renders HomeView', (tester) async {
      when(() => mockCharactersRepository.getCharacters(any()))
          .thenAnswer((_) async => const Right([]));
      await tester.pumpApp(RepositoryProvider<CharactersRepository>(
        create: (context) => mockCharactersRepository,
        child: const HomePage(),
      ));
      await tester.pumpAndSettle();
      expect(find.byType(HomeView), findsOneWidget);
    });

    testWidgets(
      'renders CharactersPage when index is 0',
      (tester) async {
        when(() => homeBloc.state).thenAnswer(
            (invocation) => const HomeState.navigationScreenChanged(0));
        when(() => mockCharactersRepository.getCharacters(any()))
            .thenAnswer((_) async => const Right([]));
        await setUpHomeView(tester);
        expect(find.byType(CharactersPage), findsOneWidget);
      },
    );

    testWidgets(
      'renders EpisodesPage when index is 1',
      (tester) async {
        when(() => homeBloc.state).thenAnswer(
            (invocation) => const HomeState.navigationScreenChanged(1));
        when(() => mockEpisodesRepository.getEpisodes(any()))
            .thenAnswer((_) async => const Right([]));
        await setUpHomeView(tester);
        expect(find.byType(EpisodesPage), findsOneWidget);
      },
    );
    testWidgets(
      'renders LocationsPage when index is 2',
      (tester) async {
        when(() => homeBloc.state).thenAnswer(
            (invocation) => const HomeState.navigationScreenChanged(2));
        when(() => mockRMLocationsRepository.getLocations(any()))
            .thenAnswer((_) async => const Right([]));
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
        when(() => mockCharactersRepository.getCharacters(any()))
            .thenAnswer((_) async => const Right([]));
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
