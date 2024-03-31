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
  final Trainer? trainerToAddTo;
  const AddQuestion({required this.question, required this.trainerToAddTo});

  @override
  List<Object> get props => [question];
}

class GenerateAnswersListEvent extends TrainerEvent {
  final Trainer trainer;
  final List<Trainer> trainerList;
  const GenerateAnswersListEvent(
      {required this.trainerList, required this.trainer});

  @override
  List<Object> get props => [trainer, trainerList];
}

class SortTrainers extends TrainerEvent {
  final String sortBy;

  const SortTrainers(this.sortBy);
}

class FilterTrainersBySubject extends TrainerEvent {
  final String subject;

  const FilterTrainersBySubject(this.subject);
}

class ClearCurrentAnswersEvent extends TrainerEvent {
  final List<Trainer> trainerList;
  const ClearCurrentAnswersEvent({required this.trainerList});

  @override
  List<Object> get props => [trainerList];
}

class AddTrainer extends TrainerEvent {
  final Trainer trainer;
  const AddTrainer({required this.trainer});

  @override
  List<Object> get props => [trainer];
}
