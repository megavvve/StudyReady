part of 'trainer_bloc.dart';

sealed class TrainerState extends Equatable {
  const TrainerState();

  @override
  List<Object> get props => [];
}

final class TrainerInitial extends TrainerState {}

final class TrainerLoading extends TrainerState {}

final class TrainerLoadFailure extends TrainerState {
  final String errorMessage;

  const TrainerLoadFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class TrainerLoadSuccess extends TrainerState {
  final List<Trainer> trainerList;
  final List<List<String>> currentTrainersAnswers;
  final List<Question> listOfQuestions;
  final List<Subject> listOfSubjects;
  final List<String> listOfCourseNums;
  final List<Chapter> listOfChapters;
  final List<Theme> listOfThemes;
  final List<String> listOfDifficults;
  const TrainerLoadSuccess(
      {this.trainerList = const <Trainer>[],
      this.currentTrainersAnswers = const [],
      this.listOfQuestions = const [],
      this.listOfSubjects = const [],
      this.listOfCourseNums = const [],
      this.listOfChapters = const [],
      this.listOfThemes = const [],
      this.listOfDifficults = const []});

  @override
  List<Object> get props => [trainerList, currentTrainersAnswers];
}
