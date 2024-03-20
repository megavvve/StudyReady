import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'study_material_event.dart';
part 'study_material_state.dart';

class StudyMaterialBloc extends Bloc<StudyMaterialEvent, StudyMaterialState> {
  StudyMaterialBloc() : super(StudyMaterialInitial()) {
    on<StudyMaterialEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
