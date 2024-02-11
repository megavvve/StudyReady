part of 'trainer_bloc.dart';

class TrainerState extends Equatable {
  final List<Trainer> trainerList;
  final List<List<String>> currentAnswers;
  const TrainerState({this.trainerList = const <Trainer>[],this.currentAnswers = const []});

  @override
  List<Object> get props => [trainerList, currentAnswers];
}
