import 'package:flutter/material.dart';
import 'package:rick_and_morty_verse/components/element_card.dart';
import 'package:rick_and_morty_verse/core/models/location/location.dart';
import 'package:rick_and_morty_verse/features/l10n/l10n.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    Key? key,
    required this.location,
  }) : super(key: key);

  final RMLocation location;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ElementCard(imageUrl: location.image ?? '', body: [
      Text(
        location.name ?? l10n.unknown,
        key: const ValueKey('location_name'),
        style: Theme.of(context).textTheme.headline5,
      ),
      const SizedBox(height: 24),
      Text(
        l10n.locationType,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: Theme.of(context).textTheme.caption!.color,
            ),
      ),
      Text(
        location.type ?? l10n.unknown,
        key: const ValueKey('location_type'),
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(height: 24),
      Text(
        l10n.dimension,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: Theme.of(context).textTheme.caption!.color,
            ),
      ),
      Text(
        location.dimension ?? l10n.unknown,
        key: const ValueKey('location_dimension'),
        style: Theme.of(context).textTheme.subtitle1,
      ),
    ]);
  }
}
