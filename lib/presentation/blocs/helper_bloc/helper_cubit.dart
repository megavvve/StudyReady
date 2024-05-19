import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_ready/data/repositories/helper_repository/helper_repository_interface.dart';

import 'helper_state.dart';

class HelperCubit extends Cubit<HelperState> {
  HelperCubit({
    required HelperRepositoryInterface helperRepository,
  })  : _helperRepository = helperRepository,
        super(const HelperState(false)) {
    _checkHelper();
  }

  final HelperRepositoryInterface _helperRepository;

  Future<void> switchHelper(bool turnedOff) async {
    emit(HelperState(turnedOff));
    await _helperRepository.switchHelper(turnedOff);
  }

  void _checkHelper() {
    final disabled = _helperRepository.isOff();
    emit(HelperState(disabled));
  }
}
