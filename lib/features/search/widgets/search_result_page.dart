import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_verse/core/blocs/characters/characters_bloc.dart';
import 'package:rick_and_morty_verse/core/blocs/episodes/episodes_bloc.dart';
import 'package:rick_and_morty_verse/core/blocs/rm_locations/rm_locations_bloc.dart';
import 'package:rick_and_morty_verse/core/cubits/search/search_cubit.dart';
import 'package:rick_and_morty_verse/core/enums/search_option.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';
import 'package:rick_and_morty_verse/core/models/episode/episode.dart';
import 'package:rick_and_morty_verse/core/models/location/location.dart';
import 'package:rick_and_morty_verse/features/characters/widgets/character_card.dart';
import 'package:rick_and_morty_verse/features/episodes/widets/episode_card.dart';
import 'package:rick_and_morty_verse/features/locations/widgets/location_card.dart';
import 'package:rick_and_morty_verse/features/search/widgets/search_result_list.dart';
import 'package:rick_and_morty_verse/features/l10n/l10n.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key, required this.option}) : super(key: key);

  final SearchOption option;

  @override
  Widget build(BuildContext context) {
    switch (option) {
      case SearchOption.characters:
        return BlocProvider<CharactersBloc>(
          create: (BuildContext context) {
            return context.read<SearchCubit>().charactersBloc!;
          },
          child: SearchResultView(
            key: const ValueKey('characters_results'),
            option: option,
          ),
        );
      case SearchOption.episodes:
        return BlocProvider<EpisodesBloc>(
          create: (BuildContext context) {
            return context.read<SearchCubit>().episodesBloc!;
          },
          child: SearchResultView(
            key: const ValueKey('episodes_results'),
            option: option,
          ),
        );
      case SearchOption.locations:
        return BlocProvider<RMLocationsBloc>(
          create: (BuildContext context) {
            return context.read<SearchCubit>().locationsBloc!;
          },
          child: SearchResultView(
            option: option,
            key: const ValueKey('locations_results'),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class SearchResultView extends StatefulWidget {
  const SearchResultView({
    Key? key,
    required this.option,
  }) : super(key: key);

  final SearchOption option;

  @override
  _SearchResultViewState createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView>
    with AutomaticKeepAliveClientMixin {
  late ScrollController _controller;
  bool canGetMoreItems = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(listener);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildResults();
  }

  BlocBuilder _buildResults() {
    switch (widget.option) {
      case SearchOption.characters:
        final bloc = context.read<CharactersBloc>();
        canGetMoreItems = bloc.canGetMore;
        return BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            return SearchResultList<Character>(
                controller: _controller,
                isLoading: bloc.state == const CharactersState.loading(),
                isLoadingMore:
                    bloc.state == const CharactersState.loadingMore(),
                isInitial: bloc.state == const CharactersState.initial(),
                isEmpty: bloc.state == const CharactersState.empty(),
                items: bloc.characters,
                itemBuilder: (character) =>
                    CharacterCard(character: character!),
                hintText: context.l10n.charactersSearchHint,
                emptyText: context.l10n.charactersSearchEmpty);
          },
        );
      case SearchOption.episodes:
        final bloc = context.read<EpisodesBloc>();
        canGetMoreItems = bloc.canGetMore;
        return BlocBuilder<EpisodesBloc, EpisodesState>(
          builder: (context, state) {
            return SearchResultList<Episode>(
                controller: _controller,
                isLoading: bloc.state == const EpisodesState.loading(),
                isLoadingMore: bloc.state == const EpisodesState.loadingMore(),
                isInitial: bloc.state == const EpisodesState.initial(),
                isEmpty: bloc.state == const EpisodesState.empty(),
                items: bloc.episodes,
                itemBuilder: (episode) => EpisodeCard(episode: episode!),
                hintText: context.l10n.episodesSearchHint,
                emptyText: context.l10n.episodesSearchEmpty);
          },
        );
      case SearchOption.locations:
        final bloc = context.read<RMLocationsBloc>();
        canGetMoreItems = bloc.canGetMore;
        return BlocBuilder<RMLocationsBloc, RMLocationsState>(
          builder: (context, state) {
            return SearchResultList<RMLocation>(
                controller: _controller,
                isLoading: bloc.state == const RMLocationsState.loading(),
                isLoadingMore:
                    bloc.state == const RMLocationsState.loadingMore(),
                isInitial: bloc.state == const RMLocationsState.initial(),
                isEmpty: bloc.state == const RMLocationsState.empty(),
                items: bloc.locations,
                itemBuilder: (location) => LocationCard(location: location!),
                hintText: context.l10n.locationsSearchHint,
                emptyText: context.l10n.locationsSearchEmpty);
          },
        );
    }
  }

  void listener() {
    final percentage =
        _controller.offset / _controller.position.maxScrollExtent;
    if (canGetMoreItems && percentage > 0.8) {
      switch (widget.option) {
        case SearchOption.characters:
          context.read<SearchCubit>().getMoreCharactersResult();
          break;
        case SearchOption.episodes:
          context.read<SearchCubit>().getMoreEpisodesResult();
          break;
        case SearchOption.locations:
          context.read<SearchCubit>().getMoreLocationsResult();
          break;
      }
    }
  }
}
