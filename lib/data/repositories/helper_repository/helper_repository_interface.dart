abstract interface class HelperRepositoryInterface {
  bool isOff();
  Future<void> switchHelper(bool value);
}