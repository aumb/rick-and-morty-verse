import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_verse/components/list_page_skeleton.dart';
import 'package:rick_and_morty_verse/core/blocs/rm_locations/rm_locations_bloc.dart';
import 'package:rick_and_morty_verse/core/models/location/location.dart';
import 'package:rick_and_morty_verse/core/repositories/locations_repository.dart';
import 'package:rick_and_morty_verse/features/l10n/l10n.dart';
import 'package:rick_and_morty_verse/features/locations/widgets/location_card.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RMLocationsBloc(context.read<RMLocationsRepository>())
        ..add(
          const RMLocationsEvent.getLocations(),
        ),
      child: const LocationsView(),
    );
  }
}

class LocationsView extends StatefulWidget {
  const LocationsView({Key? key}) : super(key: key);

  @override
  _LocationsViewState createState() => _LocationsViewState();
}

class _LocationsViewState extends State<LocationsView> {
  late ScrollController _scrollController;

  RMLocationsBloc get locationsBloc => context.read<RMLocationsBloc>();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(listener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((RMLocationsBloc c) => c.state);
    final l10n = context.l10n;
    return ListPageSkeleton<RMLocation>(
      title: l10n.locations,
      controller: _scrollController,
      items: locationsBloc.locations,
      isInitialLoad: state == const RMLocationsState.initial(),
      isLoading: state == const RMLocationsState.loading(),
      itemBuilder: (location) => LocationCard(location: location!),
    );
  }

  void listener() {
    final percentage =
        _scrollController.offset / _scrollController.position.maxScrollExtent;
    if (locationsBloc.canGetMore && percentage > 0.8) {
      locationsBloc.add(
        const RMLocationsEvent.getLocations(),
      );
    }
  }
}
