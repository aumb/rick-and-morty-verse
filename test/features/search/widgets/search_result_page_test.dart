import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_verse/core/blocs/characters/characters_bloc.dart';
import 'package:rick_and_morty_verse/core/blocs/episodes/episodes_bloc.dart';
import 'package:rick_and_morty_verse/core/blocs/rm_locations/rm_locations_bloc.dart';
import 'package:rick_and_morty_verse/core/cubits/search/search_cubit.dart';
import 'package:rick_and_morty_verse/core/enums/character_status_enum.dart';
import 'package:rick_and_morty_verse/core/enums/search_option.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';
import 'package:rick_and_morty_verse/core/models/episode/episode.dart';
import 'package:rick_and_morty_verse/core/models/location/location.dart';
import 'package:rick_and_morty_verse/features/search/widgets/search_result_page.dart';
import '../../../helpers/helpers.dart';

class MockCharactersBloc extends Mock implements CharactersBloc {}

class MockEpisodesBloc extends Mock implements EpisodesBloc {}

class MockRMLocationsBloc extends Mock implements RMLocationsBloc {}

class MockSearchCubit extends Mock implements SearchCubit {}

void main() {
  late MockSearchCubit mockSearchCubit;
  late MockCharactersBloc mockCharactersBloc;
  late MockEpisodesBloc mockEpisodesBloc;
  late MockRMLocationsBloc mockRMLocationsBloc;

  const character = Character(
    id: null,
    name: null,
    type: null,
    gender: null,
    origin: null,
    location: null,
    image: null,
    episode: null,
    species: null,
    status: CharacterStatusEnum.unknown,
    url: 'https://rickandmortyapi.com/api/character/1',
    created: null,
  );

  final episode = Episode(
    id: '1',
    name: 'Pilot',
    airDate: 'December 2, 2013',
    episode: 'S01E01',
    characters: [
      const Character(
        id: null,
        name: null,
        type: null,
        gender: null,
        origin: null,
        location: null,
        image: null,
        episode: null,
        species: null,
        status: CharacterStatusEnum.unknown,
        url: 'https://rickandmortyapi.com/api/character/1',
        created: null,
      )
    ],
    url: 'https://rickandmortyapi.com/api/episode/1',
    created: DateTime.tryParse('2017-11-10T12:56:33.798Z'),
    image: null,
  );

  final location = RMLocation(
    id: '1',
    name: 'Earth (C-137)',
    url: 'https://rickandmortyapi.com/api/location/1',
    created: DateTime.tryParse('2017-11-10T12:42:04.162Z'),
    residents: [],
    dimension: 'Dimension C-137',
    type: 'Planet',
    image: null,
  );

  setUp(() {
    mockSearchCubit = MockSearchCubit();
    mockCharactersBloc = MockCharactersBloc();
    mockEpisodesBloc = MockEpisodesBloc();
    mockRMLocationsBloc = MockRMLocationsBloc();
  });

  void setupSearchCubit() {
    when(() => mockSearchCubit.stream)
        .thenAnswer((_) => Stream.fromIterable([const SearchState.loaded()]));

    when(() => mockSearchCubit.close()).thenAnswer((_) async {});

    when(() => mockSearchCubit.charactersBloc)
        .thenAnswer((_) => mockCharactersBloc);

    when(() => mockSearchCubit.episodesBloc)
        .thenAnswer((_) => mockEpisodesBloc);

    when(() => mockSearchCubit.locationsBloc)
        .thenAnswer((_) => mockRMLocationsBloc);
  }

  void setupCharactersBloc({bool canGetmore = false}) {
    when(() => mockCharactersBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const CharactersState.loaded()]));
    when(() => mockCharactersBloc.state)
        .thenAnswer((_) => const CharactersState.loaded());
    when(() => mockCharactersBloc.canGetMore).thenAnswer((_) => canGetmore);
    when(() => mockCharactersBloc.characters)
        .thenAnswer((_) => List.generate(10, (index) => character));
    when(() => mockCharactersBloc.close()).thenAnswer((_) async {});
  }

  void setupEpisodesBloc({bool canGetmore = false}) {
    when(() => mockEpisodesBloc.stream)
        .thenAnswer((_) => Stream.fromIterable([const EpisodesState.loaded()]));
    when(() => mockEpisodesBloc.state)
        .thenAnswer((_) => const EpisodesState.loaded());
    when(() => mockEpisodesBloc.canGetMore).thenAnswer((_) => canGetmore);
    when(() => mockEpisodesBloc.episodes)
        .thenAnswer((_) => List.generate(10, (index) => episode));
    when(() => mockEpisodesBloc.close()).thenAnswer((_) async {});
  }

  void setupLocationsBloc({bool canGetmore = false}) {
    when(() => mockRMLocationsBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const RMLocationsState.loaded()]));
    when(() => mockRMLocationsBloc.state)
        .thenAnswer((_) => const RMLocationsState.loaded());
    when(() => mockRMLocationsBloc.canGetMore).thenAnswer((_) => canGetmore);
    when(() => mockRMLocationsBloc.locations)
        .thenAnswer((_) => List.generate(10, (index) => location));
    when(() => mockRMLocationsBloc.close()).thenAnswer((_) async {});
  }

  Future<void> setupSearchResultsPage(
      WidgetTester tester, SearchOption option) async {
    setupSearchCubit();
    await tester.pumpApp(
      BlocProvider<SearchCubit>(
        create: (context) => mockSearchCubit,
        child: SearchResultPage(
          option: option,
        ),
      ),
    );
  }

  group('SearchResultsPage', () {
    testWidgets('renders characters SearchResultView if option is characters',
        (tester) async {
      setupCharactersBloc();
      await setupSearchResultsPage(tester, SearchOption.characters);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('characters_results')), findsOneWidget);
    });

    testWidgets('renders episodes SearchResultView if option is episodes',
        (tester) async {
      setupEpisodesBloc();
      await setupSearchResultsPage(tester, SearchOption.episodes);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('episodes_results')), findsOneWidget);
    });

    testWidgets('renders locations SearchResultView if option is locations',
        (tester) async {
      setupLocationsBloc();
      await setupSearchResultsPage(tester, SearchOption.locations);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('locations_results')), findsOneWidget);
    });
  });

  group('SearchResultsView ', () {
    testWidgets('gets more characters when offset is 0.8', (tester) async {
      setupCharactersBloc(canGetmore: true);
      await setupSearchResultsPage(tester, SearchOption.characters);
      await tester.pumpAndSettle();
      final gesture = await tester.startGesture(Offset.zero);
      await gesture.moveBy(const Offset(0, -3500));
      await tester.pump();
      verify(() => mockSearchCubit.getMoreCharactersResult());
    });
    testWidgets('gets more episodes when offset is 0.8', (tester) async {
      setupEpisodesBloc(canGetmore: true);
      await setupSearchResultsPage(tester, SearchOption.episodes);
      await tester.pumpAndSettle();
      final gesture = await tester.startGesture(Offset.zero);
      await gesture.moveBy(const Offset(0, -3500));
      await tester.pump();
      verify(() => mockSearchCubit.getMoreEpisodesResult());
    });
    testWidgets('gets more locations when offset is 0.8', (tester) async {
      setupLocationsBloc(canGetmore: true);
      await setupSearchResultsPage(tester, SearchOption.locations);
      await tester.pumpAndSettle();
      final gesture = await tester.startGesture(Offset.zero);
      await gesture.moveBy(const Offset(0, -3500));
      await tester.pump();
      verify(() => mockSearchCubit.getMoreLocationsResult());
    });
  });
}
