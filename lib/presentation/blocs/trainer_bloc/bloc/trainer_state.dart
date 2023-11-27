part of 'trainer_bloc.dart';

class TrainersState extends Equatable {
  final List<Trainer> trainerList;

  const TrainersState({this.trainerList = const <Trainer>[]});

  @override
  List<Object> get props => [trainerList];
}
