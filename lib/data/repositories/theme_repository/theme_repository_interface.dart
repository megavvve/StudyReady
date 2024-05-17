abstract interface class ThemeRepositoryInterface {
  bool isDarkTheme();
  Future<void> setDarkTheme(bool value);
}