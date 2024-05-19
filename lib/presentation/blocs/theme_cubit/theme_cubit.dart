import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_ready/data/repositories/theme_repository/theme_repository_interface.dart';

import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    required ThemeRepositoryInterface themeRepository,
  })  : _themeRepository = themeRepository,
        super(const ThemeState(Brightness.light)) {
    _checkTheme();
  }

  final ThemeRepositoryInterface _themeRepository;

  Future<void> setThemeBrightness(Brightness brightness) async {
    emit(ThemeState(brightness));
    await _themeRepository.setDarkTheme(
      brightness == Brightness.dark,
    );
  }

  void _checkTheme() {
    final brightness =
        _themeRepository.isDarkTheme() ? Brightness.dark : Brightness.light;
    emit(ThemeState(brightness));
  }
}
