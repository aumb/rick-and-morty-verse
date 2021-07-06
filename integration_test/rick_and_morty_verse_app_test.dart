import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rick_and_morty_verse/core/cubits/theme/theme_cubit.dart';
import 'package:rick_and_morty_verse/core/enums/theme_state.dart';
import 'package:rick_and_morty_verse/core/models/episode/episode.dart';
import 'package:rick_and_morty_verse/core/models/location/location.dart';
import 'package:rick_and_morty_verse/core/utils/type_of_util.dart';
import 'package:rick_and_morty_verse/features/characters/characters_page.dart';
import 'package:rick_and_morty_verse/features/characters/widgets/character_card.dart';
import 'package:rick_and_morty_verse/features/episodes/episodes_page.dart';
import 'package:rick_and_morty_verse/features/episodes/widets/episode_card.dart';
import 'package:rick_and_morty_verse/features/locations/locations_page.dart';
import 'package:rick_and_morty_verse/features/locations/widgets/location_card.dart';
import 'package:rick_and_morty_verse/features/search/search_page.dart';
import 'package:rick_and_morty_verse/features/search/widgets/search_result_list.dart';
import 'package:rick_and_morty_verse/features/settings/settings_page.dart';
import 'package:rick_and_morty_verse/features/settings/widgets/theme_list_tile.dart';
import 'package:rick_and_morty_verse/main_development.dart' as main_dev;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  void setupApp() {
    main_dev.main();
  }

  setUp(setupApp);

  group('Home', () {
    group('Characters tab', () {
      testWidgets('renders CharactersPage', (WidgetTester tester) async {
        await tester.pumpAndSettle();
        expect(find.byType(CharactersPage), findsOneWidget);
      });

      testWidgets('renders CharactersPage loading',
          (WidgetTester tester) async {
        await tester.pump();
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('renders CharactersPage loaded', (WidgetTester tester) async {
        await tester.pumpAndSettle();
        expect(find.byType(CharacterCard), findsWidgets);
      });

      //TODO: solve - not working on IOS
      testWidgets('renders CharactersPage while loading more',
          (WidgetTester tester) async {
        await tester.pumpAndSettle();
        final gesture = await tester.startGesture(Offset.zero);
        await gesture.moveBy(const Offset(0, -10500));
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    });

    group('Episodes tab', () {
      testWidgets('renders EpisodesPage', (WidgetTester tester) async {
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('episodes_icon_button'),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(EpisodesPage), findsOneWidget);
      });

      testWidgets('renders EpisodesPage loading', (WidgetTester tester) async {
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('episodes_icon_button'),
          ),
        );
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('renders EpisodesPage loaded', (WidgetTester tester) async {
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('episodes_icon_button'),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(EpisodeCard), findsWidgets);
      });

      //TODO: solve - not working on IOS
      // testWidgets('renders EpisodesPage while loading more',
      //     (WidgetTester tester) async {
      //   await tester.pumpAndSettle();
      //   await tester.tap(
      //     find.byKey(
      //       const Key('episodes_icon_button'),
      //     ),
      //   );
      //   await tester.pumpAndSettle();
      //   final gesture = await tester.startGesture(Offset.zero);
      //   await gesture.moveBy(const Offset(0, -10500));
      //   await tester.pump();
      //   expect(find.byType(CircularProgressIndicator), findsWidgets);
      // });
    });

    group('Locations tab', () {
      testWidgets('renders LocationsPage', (WidgetTester tester) async {
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('locations_icon_button'),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(LocationsPage), findsOneWidget);
      });

      testWidgets('renders LocationsPage loading', (WidgetTester tester) async {
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('locations_icon_button'),
          ),
        );
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('renders LocationsPage loaded', (WidgetTester tester) async {
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('locations_icon_button'),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(LocationCard), findsWidgets);
      });

      //TODO: solve - not working on IOS
      // testWidgets('renders LocationsPage while loading more',
      //     (WidgetTester tester) async {
      //   await tester.pumpAndSettle();
      //   await tester.tap(
      //     find.byKey(
      //       const Key('locations_icon_button'),
      //     ),
      //   );
      //   await tester.pumpAndSettle();
      //   final gesture = await tester.startGesture(Offset.zero);
      //   await gesture.moveBy(const Offset(0, -200500));
      //   await tester.pump();
      //   expect(find.byType(CircularProgressIndicator), findsWidgets);
      // });
    });

    group('Settings tab', () {
      testWidgets('renders SettingsPage', (WidgetTester tester) async {
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('settings_icon_button'),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(SettingsPage), findsOneWidget);
      });

      testWidgets('renders dark theme', (WidgetTester tester) async {
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('settings_icon_button'),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byType(ThemeListTile));
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('radio_dark_theme'),
          ),
        );
        await tester.pumpAndSettle();
        expect(ThemeCubit().theme, equals(ThemeState.dark));
      });

      testWidgets('renders light theme', (WidgetTester tester) async {
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('settings_icon_button'),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byType(ThemeListTile));
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('radio_light_theme'),
          ),
        );
        await tester.pumpAndSettle();
        expect(ThemeCubit().theme, equals(ThemeState.light));
      });

      testWidgets('renders system theme', (WidgetTester tester) async {
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('settings_icon_button'),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byType(ThemeListTile));
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('radio_system_theme'),
          ),
        );
        await tester.pumpAndSettle();
        expect(ThemeCubit().theme, equals(ThemeState.system));
      });
    });

    group('Search screen', () {
      const query = 'morty';
      const randomQuery = 'bquwjnkleml';

      Future<void> setupSearch(WidgetTester tester) async {
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('search_fab'),
          ),
        );
        await tester.pumpAndSettle();
      }

      Future<void> setupSearchQuery(
        WidgetTester tester, {
        bool random = false,
      }) async {
        await tester.enterText(
            find.byType(TextField), random ? randomQuery : query);
        await tester.testTextInput.receiveAction(TextInputAction.done);
      }

      testWidgets('renders SearchPage', (WidgetTester tester) async {
        await setupSearch(tester);
        expect(find.byType(SearchPage), findsOneWidget);
      });

      group('Search Locations', () {
        testWidgets('renders locations tab', (WidgetTester tester) async {
          await setupSearch(tester);
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(const Key('SearchOption.locations')));
          await tester.pumpAndSettle();
          expect(find.byType(typeOf<SearchResultList<RMLocation>>()),
              findsOneWidget);
        });
        testWidgets('renders intial hint text when first landing on page',
            (WidgetTester tester) async {
          await setupSearch(tester);
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(const Key('SearchOption.locations')));
          await tester.pumpAndSettle();
          expect(find.byKey(const Key('hint_text')), findsOneWidget);
        });
        testWidgets('renders CircularProgressIndicator when user searches',
            (WidgetTester tester) async {
          await setupSearch(tester);
          await tester.tap(find.byKey(const Key('SearchOption.locations')));
          await tester.pumpAndSettle();
          await setupSearchQuery(tester);
          await tester.pump();
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        });

        testWidgets(
            'renders at least 1 LocationsCard when search is successful',
            (WidgetTester tester) async {
          await setupSearch(tester);
          await tester.tap(find.byKey(const Key('SearchOption.locations')));
          await tester.pumpAndSettle();
          await setupSearchQuery(tester);
          await tester.pumpAndSettle();
          expect(find.byType(LocationCard), findsWidgets);
        });

        testWidgets('renders empty text when search fails',
            (WidgetTester tester) async {
          await setupSearch(tester);
          await tester.tap(find.byKey(const Key('SearchOption.locations')));
          await tester.pumpAndSettle();
          await setupSearchQuery(tester, random: true);
          await tester.pumpAndSettle();
          expect(find.byKey(const Key('empty_text')), findsOneWidget);
        });
      });

      group('Search Episodes', () {
        testWidgets('renders episodes tab', (WidgetTester tester) async {
          await setupSearch(tester);
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(const Key('SearchOption.episodes')));
          await tester.pumpAndSettle();
          expect(
              find.byType(typeOf<SearchResultList<Episode>>()), findsOneWidget);
        });
        testWidgets('renders intial hint text when first landing on page',
            (WidgetTester tester) async {
          await setupSearch(tester);
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(const Key('SearchOption.episodes')));
          await tester.pumpAndSettle();
          expect(find.byKey(const Key('hint_text')), findsOneWidget);
        });
        testWidgets('renders CircularProgressIndicator when user searches',
            (WidgetTester tester) async {
          await setupSearch(tester);
          await tester.tap(find.byKey(const Key('SearchOption.episodes')));
          await tester.pumpAndSettle();
          await setupSearchQuery(tester);
          await tester.pump();
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        });

        testWidgets('renders at least 1 EpisodeCard when search is successful',
            (WidgetTester tester) async {
          await setupSearch(tester);
          await tester.tap(find.byKey(const Key('SearchOption.episodes')));
          await tester.pumpAndSettle();
          await setupSearchQuery(tester);
          await tester.pumpAndSettle();
          expect(find.byType(EpisodeCard), findsWidgets);
        });

        testWidgets('renders empty text when search fails',
            (WidgetTester tester) async {
          await setupSearch(tester);
          await tester.tap(find.byKey(const Key('SearchOption.episodes')));
          await tester.pumpAndSettle();
          await setupSearchQuery(tester, random: true);
          await tester.pumpAndSettle();
          expect(find.byKey(const Key('empty_text')), findsOneWidget);
        });
      });

      group('Search Characters', () {
        testWidgets('renders intial hint text when first landing on page',
            (WidgetTester tester) async {
          await setupSearch(tester);
          await tester.pumpAndSettle();
          expect(find.byKey(const Key('hint_text')), findsOneWidget);
        });
        testWidgets('renders CircularProgressIndicator when user searches',
            (WidgetTester tester) async {
          await setupSearch(tester);
          await setupSearchQuery(tester);
          await tester.pump();
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        });

        testWidgets(
            'renders at least 1 CharacterCard when search is successful',
            (WidgetTester tester) async {
          await setupSearch(tester);
          await setupSearchQuery(tester);
          await tester.pumpAndSettle();
          expect(find.byType(CharacterCard), findsWidgets);
        });

        testWidgets('renders empty text when search fails',
            (WidgetTester tester) async {
          await setupSearch(tester);
          await setupSearchQuery(tester, random: true);
          await tester.pumpAndSettle();
          expect(find.byKey(const Key('empty_text')), findsOneWidget);
        });
      });
    });
  });
}
