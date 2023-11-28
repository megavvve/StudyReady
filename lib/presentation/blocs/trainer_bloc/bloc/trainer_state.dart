part of 'trainer_bloc.dart';

class TrainersState extends Equatable {
  final List<Trainer> trainerList;
  final List<List<String>> currentAnswers;
  const TrainersState({this.trainerList = const <Trainer>[],this.currentAnswers = const []});

  @override
  List<Object> get props => [trainerList, currentAnswers];
}
