import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/domain/usecases/study_material/get_study_materials.dart';

part 'study_material_event.dart';
part 'study_material_state.dart';

class StudyMaterialBloc extends Bloc<StudyMaterialEvent, StudyMaterialState> {
  final GetStudyMaterials getStudyMaterials;
  StudyMaterialBloc(this.getStudyMaterials) : super(StudyMaterialInitial()) {
    on<AddMaterial>(_onAddQuestion);
    on<MaterialInitLoadEvent>(_onInitLoad);
  }

  void _onAddQuestion(
      AddMaterial event, Emitter<StudyMaterialState> emit) async {
    final state = this.state;
    if (state is StudyMaterialLoadSuccess) {
      final material = event.material;

      List<StudyMaterial> allMaterials = state.materials;

      allMaterials.add(material);
      emit(
        StudyMaterialLoadSuccess(
          materials: allMaterials,
        ),
      );
    }
  }

  void _onInitLoad(
      MaterialInitLoadEvent event, Emitter<StudyMaterialState> emit) async {
    try {
      final allMaterials = await getStudyMaterials.call();

      if (allMaterials.isEmpty) {
        emit(const StudyMaterialError(message: "Ошибка инициализации"));
      } else {
        emit(
          StudyMaterialLoadSuccess(
            materials: allMaterials,
          ),
        );
      }
    } catch (error) {
      emit(StudyMaterialError(message: "Ошибка загрузки данных: $error"));
    }
  }
}
