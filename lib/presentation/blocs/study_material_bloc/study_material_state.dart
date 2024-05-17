part of 'study_material_bloc.dart';

abstract class StudyMaterialState extends Equatable {
  const StudyMaterialState();

  @override
  List<Object> get props => [];
}

final class StudyMaterialInitial extends StudyMaterialState {}

class StudyMaterialLoading extends StudyMaterialState {
  @override
  String toString() => 'StudyMaterialLoading';
}

class StudyMaterialLoadSuccess extends StudyMaterialState {
  final List<StudyMaterial> materials;

  const StudyMaterialLoadSuccess({required this.materials});

  @override
  List<Object> get props => [materials];

  @override
  String toString() => 'StudyMaterialLoaded { materials: $materials }';
}

class StudyMaterialError extends StudyMaterialState {
  final String message;

  const StudyMaterialError({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'StudyMaterialError { message: $message }';
}
