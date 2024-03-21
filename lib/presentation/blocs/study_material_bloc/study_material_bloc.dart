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

      // Добавление нового материала к существующему списку
      allMaterials.add(material);

      // В этом месте вы можете вызвать ваш репозиторий или другой сервис для сохранения материала
      // Например, materialRepository.addMaterial(material);

      // После добавления материала, мы должны обновить состояние, чтобы отразить изменения
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
      print(
        "-------------------",
      );
      final allMaterials = await getStudyMaterials.call();

      if (allMaterials.isEmpty) {
        print("111111111111111");
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
