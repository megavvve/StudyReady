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
