import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_verse/components/search_tab_bar.dart';
import 'package:rick_and_morty_verse/components/search_bar.dart';
import 'package:rick_and_morty_verse/core/blocs/characters/characters_bloc.dart';
import 'package:rick_and_morty_verse/core/blocs/episodes/episodes_bloc.dart';
import 'package:rick_and_morty_verse/core/blocs/rm_locations/rm_locations_bloc.dart';
import 'package:rick_and_morty_verse/core/cubits/search/search_cubit.dart';
import 'package:rick_and_morty_verse/core/repositories/characters_repository.dart';
import 'package:rick_and_morty_verse/core/repositories/episodes_repository.dart';
import 'package:rick_and_morty_verse/core/repositories/locations_repository.dart';
import 'package:rick_and_morty_verse/features/search/widgets/search_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        charactersBloc: CharactersBloc(context.read<CharactersRepository>()),
        episodesBloc: EpisodesBloc(context.read<EpisodesRepository>()),
        locationsBloc: RMLocationsBloc(context.read<RMLocationsRepository>()),
      ),
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              SearchBar(),
              SearchTabBar(),
              const Expanded(
                child: SearchBody(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
