part of 'study_material_bloc.dart';

abstract class StudyMaterialEvent extends Equatable {
  const StudyMaterialEvent();

  @override
  List<Object> get props => [];
}

class MaterialInitLoadEvent extends StudyMaterialEvent {
  const MaterialInitLoadEvent();

  @override
  List<Object> get props => [];
}

class AddMaterial extends StudyMaterialEvent {
  final StudyMaterial studyMaterial;

  const AddMaterial({required this.studyMaterial});

  @override
  List<Object> get props => [studyMaterial];

  @override
  String toString() => 'AddMaterial { material: $studyMaterial }';
}

class DeleteMaterial extends StudyMaterialEvent {
  final StudyMaterial studyMaterial;

  const DeleteMaterial({required this.studyMaterial});

  @override
  List<Object> get props => [studyMaterial];

  @override
  String toString() => 'AddMaterial { material: $studyMaterial }';
}

class UpdateMaterial extends StudyMaterialEvent {
  final StudyMaterial material;

  const UpdateMaterial(this.material);

  @override
  List<Object> get props => [material];

  @override
  String toString() => 'UpdateMaterial { material: $material }';
}

class MaterialLoadFailureEvent extends StudyMaterialEvent {
  const MaterialLoadFailureEvent();

  @override
  List<Object> get props => [];
}
