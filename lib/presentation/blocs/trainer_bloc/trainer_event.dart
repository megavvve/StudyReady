part of 'trainer_bloc.dart';

abstract class TrainerEvent extends Equatable {
  const TrainerEvent();

  @override
  List<Object> get props => [];
}

class InitLoad extends TrainerEvent {
  const InitLoad();

  @override
  List<Object> get props => [];
}

class AddQuestion extends TrainerEvent {
  final Question question;

  const AddQuestion({required this.question});

  @override
  List<Object> get props => [question];
}

class GenerateAnswersListEvent extends TrainerEvent {
  final Trainer trainer;

  const GenerateAnswersListEvent({required this.trainer});

  @override
  List<Object> get props => [trainer];
}

class ClearCurrentAnswersEvent extends TrainerEvent {
  const ClearCurrentAnswersEvent();

  @override
  List<Object> get props => [];
}

class ReloadingListOfTrainerEvent extends TrainerEvent {
  const ReloadingListOfTrainerEvent();

    @override
  List<Object> get props => [];
}
