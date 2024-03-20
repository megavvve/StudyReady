part of 'study_material_bloc.dart';

sealed class StudyMaterialState extends Equatable {
  const StudyMaterialState();
  
  @override
  List<Object> get props => [];
}

final class StudyMaterialInitial extends StudyMaterialState {}
