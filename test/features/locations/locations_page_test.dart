import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_verse/core/blocs/rm_locations/rm_locations_bloc.dart';
import 'package:rick_and_morty_verse/core/models/location/location.dart';
import 'package:rick_and_morty_verse/core/repositories/locations_repository.dart';
import 'package:rick_and_morty_verse/features/locations/locations_page.dart';
import 'package:rick_and_morty_verse/features/locations/widgets/location_card.dart';

import '../../fixtures/fixture_reader.dart';
import '../../helpers/helpers.dart';

class MockRMLocationsRepository extends Mock implements RMLocationsRepository {}

class RMLocationsStateFake extends Fake implements RMLocationsState {}

class RMLocationsEventFake extends Fake implements RMLocationsEvent {}

class MockRMLocationsBloc extends MockBloc<RMLocationsEvent, RMLocationsState>
    implements RMLocationsBloc {}

void main() {
  group('Locations', () {
    late RMLocationsBloc mockRMLocationsBloc;
    late MockRMLocationsRepository mockRMLocationsRepository;

    var tRMLocations =
        RMLocation.fromJsonList(json.decode(fixture('locations.json'))) ?? [];

    setUp(() {
      initHydratedBloc();
      registerFallbackValue(RMLocationsStateFake());
      registerFallbackValue(RMLocationsEventFake());
      mockRMLocationsBloc = MockRMLocationsBloc();
      mockRMLocationsRepository = MockRMLocationsRepository();
    });

    tearDown(() {
      mockRMLocationsBloc.close();
    });

    void setupEmptyList() {
      when(() => mockRMLocationsRepository.getLocations(any()))
          .thenAnswer((_) async => const Right([]));
    }

    Future<void> setupRMLocationsView(WidgetTester tester) async {
      await tester.pumpApp(BlocProvider<RMLocationsBloc>(
        create: (_) => mockRMLocationsBloc,
        child: const LocationsView(),
      ));
    }

    testWidgets('renders LocationsView', (tester) async {
      setupEmptyList();
      await tester.pumpApp(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider<RMLocationsRepository>(
              create: (_) => mockRMLocationsRepository,
            ),
          ],
          child: const LocationsPage(),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(LocationsView), findsOneWidget);
    });

    group('LocationsView', () {
      testWidgets('renders a CircularProgresIndicator if state is initial',
          (tester) async {
        when(() => mockRMLocationsBloc.state)
            .thenReturn(const RMLocationsState.initial());
        when((() => mockRMLocationsBloc.locations)).thenReturn([]);
        await setupRMLocationsView(tester);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
      testWidgets('renders a CircularProgresIndicator if state is loading',
          (tester) async {
        when(() => mockRMLocationsBloc.state)
            .thenReturn(const RMLocationsState.loading());
        when(() => mockRMLocationsBloc.canGetMore).thenReturn(true);
        when((() => mockRMLocationsBloc.locations)).thenReturn(tRMLocations);
        await setupRMLocationsView(tester);
        final gesture = await tester.startGesture(Offset.zero);
        await gesture.moveBy(const Offset(0, -700));
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
      testWidgets('renders 3 LocationCard if state is loaded', (tester) async {
        when(() => mockRMLocationsBloc.canGetMore).thenReturn(false);
        when(() => mockRMLocationsBloc.state)
            .thenReturn(const RMLocationsState.loaded());
        when((() => mockRMLocationsBloc.locations)).thenReturn(tRMLocations);
        await setupRMLocationsView(tester);

        final gesture = await tester.startGesture(const Offset(0.0, 100.0));
        await gesture.moveBy(const Offset(0.0, -400.0));
        await tester.pump();
        expect(find.byType(LocationCard), findsNWidgets(3));
      });
    });
  });
}
