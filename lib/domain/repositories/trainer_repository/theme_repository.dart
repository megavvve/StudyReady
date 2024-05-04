import 'package:study_ready/domain/entities/theme.dart';

abstract class ThemeRepository {
  Future<List<Theme>> getThemes();
  Future<int> insertTheme(Theme theme);
  Future<int> deleteTheme(int id);
  Future<List<Theme>> themeFullInfo();
}
