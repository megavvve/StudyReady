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
  final StudyMaterial material;

  const AddMaterial(this.material);

  @override
  List<Object> get props => [material];

  @override
  String toString() => 'AddMaterial { material: $material }';
}

class UpdateMaterial extends StudyMaterialEvent {
  final StudyMaterial material;

  const UpdateMaterial(this.material);

  @override
  List<Object> get props => [material];

  @override
  String toString() => 'UpdateMaterial { material: $material }';
}

class DeleteMaterial extends StudyMaterialEvent {
  final StudyMaterial material;

  const DeleteMaterial(this.material);

  @override
  List<Object> get props => [material];

  @override
  String toString() => 'DeleteMaterial { material: $material }';
}
