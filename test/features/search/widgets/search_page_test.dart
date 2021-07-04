import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_verse/components/search_bar.dart';
import 'package:rick_and_morty_verse/components/search_tab_bar.dart';
import 'package:rick_and_morty_verse/core/repositories/characters_repository.dart';
import 'package:rick_and_morty_verse/core/repositories/episodes_repository.dart';
import 'package:rick_and_morty_verse/core/repositories/locations_repository.dart';
import 'package:rick_and_morty_verse/features/search/search_page.dart';
import 'package:rick_and_morty_verse/features/search/widgets/search_body.dart';
import '../../../helpers/helpers.dart';

class MockCharactersRepository extends Mock implements CharactersRepository {}

class MockEpisodesRepository extends Mock implements EpisodesRepository {}

class MockRMLocationsRepository extends Mock implements RMLocationsRepository {}

void main() {
  late MockCharactersRepository mockCharactersRepository;
  late MockEpisodesRepository mockEpisodesRepository;
  late MockRMLocationsRepository mockRMLocationsRepository;

  setUp(() {
    mockCharactersRepository = MockCharactersRepository();
    mockEpisodesRepository = MockEpisodesRepository();
    mockRMLocationsRepository = MockRMLocationsRepository();
  });

  Future<void> setupSearchPage(WidgetTester tester) async {
    await tester.pumpApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<CharactersRepository>(
              create: (context) => mockCharactersRepository),
          RepositoryProvider<EpisodesRepository>(
              create: (context) => mockEpisodesRepository),
          RepositoryProvider<RMLocationsRepository>(
              create: (context) => mockRMLocationsRepository),
        ],
        child: const SearchPage(),
      ),
    );
  }

  group('Search Page', () {
    testWidgets('renders SearchBar', (tester) async {
      await setupSearchPage(tester);
      await tester.pumpAndSettle();
      expect(find.byType(SearchBar), findsOneWidget);
    });

    testWidgets('renders SearchTabBar', (tester) async {
      await setupSearchPage(tester);
      await tester.pumpAndSettle();
      expect(find.byType(SearchTabBar), findsOneWidget);
    });

    testWidgets('renders SearchBody', (tester) async {
      await setupSearchPage(tester);
      await tester.pumpAndSettle();
      expect(find.byType(SearchBody), findsOneWidget);
    });
  });
}
