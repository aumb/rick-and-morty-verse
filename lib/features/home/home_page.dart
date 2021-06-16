import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_verse/components/empty_page.dart';
import 'package:rick_and_morty_verse/core/blocs/home/home_bloc.dart';
import 'package:rick_and_morty_verse/features/characters/characters_page.dart';
import 'package:rick_and_morty_verse/features/episodes/episodes_page.dart';
import 'package:rick_and_morty_verse/features/home/widgets/custom_nav_bar.dart';
import 'package:rick_and_morty_verse/features/locations/locations_page.dart';
import 'package:rick_and_morty_verse/features/settings/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((HomeBloc c) => c.state);
    return Scaffold(
      extendBody: true,
      body: _getScreenFromIndex(state.selectedIndex),
      bottomNavigationBar: CustomNavBar(
          index: state.selectedIndex,
          onTabChange: (currentTabIndex) {
            context.read<HomeBloc>().add(
                  HomeEvent.itemSelected(currentTabIndex),
                );
          }),
    );
  }

  Widget _getScreenFromIndex(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const CharactersPage();
      case 1:
        return const EpisodesPage();
      case 2:
        return const LocationsPage();
      case 3:
        return const SettingsPage();
      default:
        return const EmptyPage();
    }
  }
}
