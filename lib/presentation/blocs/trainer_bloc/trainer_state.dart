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
  final List<List<String>> currentAnswers;
  const TrainerLoadSuccess(
      {this.trainerList = const <Trainer>[], this.currentAnswers = const []});

  @override
  List<Object> get props => [trainerList, currentAnswers];
}
