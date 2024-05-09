import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/domain/usecases/study_material/add_study_material.dart';
import 'package:study_ready/domain/usecases/study_material/get_study_material.dart';
import 'package:study_ready/domain/usecases/study_material/get_study_materials.dart';

part 'study_material_event.dart';
part 'study_material_state.dart';

class StudyMaterialBloc extends Bloc<StudyMaterialEvent, StudyMaterialState> {
  final GetStudyMaterials getStudyMaterials;
  final GetStudyMaterial getStudyMaterial;
  final AddStudyMaterial addMaterial;
  StudyMaterialBloc(
      this.getStudyMaterials, this.getStudyMaterial, this.addMaterial)
      : super(StudyMaterialInitial()) {
    on<AddMaterial>(_onAddMaterial);
    on<MaterialInitLoadEvent>(_onInitLoad);
  }

  void _onAddMaterial(
      AddMaterial event, Emitter<StudyMaterialState> emit) async {
    final state = this.state;
    if (state is StudyMaterialLoadSuccess) {
      final studyMaterial = event.studyMaterial;
      final file = File(studyMaterial.filePath);
      String fileName = studyMaterial.filePath.split('/').last;
      final appDocDir = await getApplicationDocumentsDirectory();
      final String filePath = "${appDocDir.path}/$fileName";
      await file.copy(filePath);

      final StudyMaterial newMaterial = StudyMaterial(
        id: studyMaterial.id,
        fileName: studyMaterial.fileName,
        filePath: filePath,
        subjectName: studyMaterial.subjectName,
        uploadDate: studyMaterial.uploadDate,
        fileType: studyMaterial.fileType,
      );

      List<StudyMaterial> allMaterials = state.materials;
      addMaterial.call(newMaterial);
      allMaterials.add(newMaterial);
      emit(
        StudyMaterialLoadSuccess(
          materials: allMaterials,
        ),
      );
    }
  }

  void _onDeleteMaterial(
      DeleteMaterial event, Emitter<StudyMaterialState> emit) async {
    final state = this.state;

    if (state is StudyMaterialLoadSuccess) {
      final studyMaterial = event.studyMaterial;
      final file = File(studyMaterial.filePath);

      List<StudyMaterial> allMaterials = state.materials;
      // addMaterial.call(newMaterial);
      allMaterials.remove(studyMaterial);
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
      for (var element in allMaterials) {
        print(element.filePath);
      }
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
