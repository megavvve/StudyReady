import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:study_ready/data/local/db/app_db.dart';
import 'package:study_ready/domain/models/question.dart';


part 'trainer_event.dart';
part 'trainer_state.dart';

class TrainersBloc extends Bloc<TrainerEvent, TrainersState> {
 // final db = AppDB();


  TrainersBloc() : super(const TrainersState()) {
    on<AddQuestion>(_onAddQuestion);
    on<InitLoad>(_onInitLoad);
  }

  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/jsons/trainers.json');
    final data = jsonDecode(jsonString);
    print(data);
  }


  void _onAddQuestion(AddQuestion event, Emitter<TrainersState> emit) {
    // final state = this.state;
    // final question = event.question;

    // db.insertQuestion(question);
    // emit(TrainersState(trainerList: List.from(state.trainerList)..add(question)));
  }

 

  Future<void> _onInitLoad(InitLoad event, Emitter<TrainersState> emit) async {
    // List<Trainer> allTrainers = await db.get();

    // emit(
    //   TrainersState(
    //     trainerList: allTrainers,
    //   ),
    // );
    loadJsonAsset();
  }

}
