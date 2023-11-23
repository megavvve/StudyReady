import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trainer_event.dart';
part 'trainer_state.dart';

class TrainerBloc extends Bloc<TrainerEvent, TrainerState> {
  TrainerBloc() : super(TrainerInitial()) {
    on<TrainerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
