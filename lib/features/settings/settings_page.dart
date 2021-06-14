import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_verse/components/custom_bottom_modal_sheet.dart';

import 'package:rick_and_morty_verse/components/page_skeleton.dart';
import 'package:rick_and_morty_verse/components/radio_widget.dart';
import 'package:rick_and_morty_verse/core/cubits/theme/theme_cubit.dart';
import 'package:rick_and_morty_verse/core/enums/theme_state.dart';
import 'package:rick_and_morty_verse/features/l10n/l10n.dart';
import 'package:rick_and_morty_verse/features/settings/widgets/theme_list_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SettingsView();
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: PageSkeleton(
        title: l10n.settings,
        body: SliverList(
          delegate: SliverChildListDelegate(
            [
              _buildThemeSetting(l10n),
            ],
          ),
        ),
      ),
    );
  }

  BlocConsumer<ThemeCubit, ThemeState> _buildThemeSetting(
      AppLocalizations l10n) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) => Navigator.of(context).pop(),
      builder: (context, state) {
        return ThemeListTile(
          iconData: Icons.palette_outlined,
          title: l10n.themeTitle,
          subtitle: l10n.themeSubTitle,
          onTap: () => showModalBottomSheet(
            context: context,
            backgroundColor: Theme.of(context).dialogBackgroundColor,
            isDismissible: true,
            builder: (context) => CustomModalBottomSheet(
              title: l10n.themeTitle,
              children: [
                RadioWidget<ThemeState>(
                  key: const ValueKey('radio_dark_theme'),
                  title: l10n.darkTheme,
                  groupValue: state,
                  value: ThemeState.dark,
                  onChanged: (value) => updateTheme(context, value),
                ),
                RadioWidget<ThemeState>(
                  key: const Key('radio_light_theme'),
                  title: l10n.lightTheme,
                  groupValue: state,
                  value: ThemeState.light,
                  onChanged: (value) => updateTheme(context, value),
                ),
                RadioWidget<ThemeState>(
                  key: const Key('radio_system_theme'),
                  title: l10n.systemTheme,
                  groupValue: state,
                  value: ThemeState.system,
                  onChanged: (value) => updateTheme(context, value),
                ),
              ],
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
          ),
        );
      },
    );
  }

  void updateTheme(BuildContext context, ThemeState value) =>
      context.read<ThemeCubit>().theme = value;
}
