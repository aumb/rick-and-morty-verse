import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rick_and_morty_verse/core/enums/theme_state.dart';
import 'package:rick_and_morty_verse/core/utils/theme_utils.dart';

final Map<ThemeState, ThemeData> _themeData = {
  ThemeState.light: ThemeUtils.light,
  ThemeState.dark: ThemeUtils.dark,
};

/// Saves and loads information regarding the theme setting.
class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(defaultTheme);

  static const defaultTheme = ThemeState.system;

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    return ThemeState.values[json['value']];
  }

  @override
  Map<String, int> toJson(ThemeState state) {
    return {
      'value': state.index,
    };
  }

  ThemeState get theme => state;

  set theme(ThemeState themeState) => emit(themeState);

  /// Returns appropiate theme mode
  ThemeMode get themeMode {
    switch (state) {
      case ThemeState.light:
        return ThemeMode.light;
      case ThemeState.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  /// Default light theme
  ThemeData? get lightTheme => _themeData[ThemeState.light];

  /// Default dark theme
  ThemeData? get darkTheme => _themeData[ThemeState.dark];
}
