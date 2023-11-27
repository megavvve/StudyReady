import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:study_ready/data/local/db/app_db.dart' as db;
import 'package:study_ready/domain/database/initialize/first_launch.dart';
import 'package:study_ready/domain/models/question.dart';
import 'package:study_ready/domain/models/trainer.dart';

part 'trainer_event.dart';
part 'trainer_state.dart';

class TrainersBloc extends Bloc<TrainerEvent, TrainersState> {
  db.AppDB dataBase = db.AppDB();

  TrainersBloc() : super(const TrainersState()) {
    on<AddQuestion>(_onAddQuestion);
    on<InitLoad>(_onInitLoad);
  }

  void _onAddQuestion(AddQuestion event, Emitter<TrainersState> emit) {
    // final state = this.state;
    // final question = event.question;

    // db.insertQuestion(question);
    // emit(TrainersState(trainerList: List.from(state.trainerList)..add(question)));
  }

  Future<void> _onInitLoad(InitLoad event, Emitter<TrainersState> emit) async {
    //final Trainer trainer = dataBase.

    final trainerFromDb = await dataBase.getTrainerFullInfoById(1);
    List<Question> questionFromTrainer = [];
    for (var i = 1; i <= trainerFromDb.questions.length; i++) {
      db.QuestionsComplete quest = await dataBase.getQuestionFullInfoById(i);
      questionFromTrainer.add(Question(
          quest.id,
          quest.course,
          quest.subject,
          quest.chapter,
          quest.theme,
          quest.difficultly,
          quest.context,
          quest.rightAnswer,
          quest.incorrectAnswers));
    }
    List<Trainer> allTrainers = [
      Trainer(
        id: trainerFromDb.id,
        name: trainerFromDb.name,
        color: trainerFromDb.color,
        image: trainerFromDb.image,
        questions: questionFromTrainer,
      )
    ];
    emit(
      TrainersState(
        trainerList: allTrainers,
      ),
    );
  }
}
