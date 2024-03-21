import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:study_ready/domain/entities/question.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/domain/usecases/get_question_full_info_by_id.dart';
import 'package:study_ready/domain/usecases/get_trainer_full_info_by_id.dart';
import 'package:study_ready/domain/usecases/get_trainers.dart';
import 'package:study_ready/domain/usecases/insert_question.dart';
import 'package:study_ready/domain/usecases/insert_trainer.dart';
import 'package:study_ready/domain/usecases/update_trainer.dart';
import 'package:study_ready/utils/app_strings.dart';

part 'trainer_event.dart';
part 'trainer_state.dart';

class TrainerBloc extends Bloc<TrainerEvent, TrainerState> {
  final InsertTrainer insertTrainer;
  final InsertQuestion insertQuestion;
  final UpdateTrainer updateTrainer;
  final GetTrainers getTrainers;
  final GetTrainerFullInfoById getTrainerFullInfoById;
  final GetQuestionFullInfoById getQuestionFullInfoById;
  TrainerBloc(
      this.insertTrainer,
      this.insertQuestion,
      this.updateTrainer,
      this.getTrainers,
      this.getTrainerFullInfoById,
      this.getQuestionFullInfoById)
      : super(TrainerInitial()) {
    on<AddQuestion>(_onAddQuestion);
    on<InitLoad>(_onInitLoad);
    on<GenerateAnswersListEvent>(_onGenerateAnswers);
    on<ClearCurrentAnswersEvent>(_onCleanCurrentAnswers);
  }

  void _onAddQuestion(AddQuestion event, Emitter<TrainerState> emit) async {
    final state = this.state;
    if (state is TrainerLoadSuccess) {
      final question = event.question;

      List<Trainer> allTrainer = state.trainerList;

      bool trainerExists =
          allTrainer.any((trainer) => trainer.trainerName == "Свой тренажер");

      if (trainerExists) {
        Trainer trainer = allTrainer
            .firstWhere((trainer) => trainer.trainerName == "Свой тренажер");

        trainer.questions.add(question);
        allTrainer.removeLast();

        allTrainer.add(
          Trainer(
            id: trainer.id,
            trainerName: trainer.trainerName,
            color: trainer.color,
            image: trainer.image,
            questions: trainer.questions,
            subjectName: 'Свой тренажер',
            description: descriptionForMyTrainer,
          ),
        );

        insertQuestion.call(question);
        List<String> questionsWithStrId = [];
        for (var i in trainer.questions) {
          questionsWithStrId.add(i.id.toString());
        }
        //questionsWithStrId.add(question.id.toString());

        updateTrainer.call(trainer);
      } else {
        Trainer trainer = Trainer(
          id: allTrainer.last.id + 1,
          trainerName: "Свой тренажер",
          subjectName: "Свой тренажер",
          description: descriptionForMyTrainer,
          color: "0xFFE3945F",
          image: "",
          questions: [question],
        );
        allTrainer.add(
          trainer,
        );

        insertQuestion.call(question);
        insertTrainer.call(trainer);
      }

      emit(
        TrainerLoadSuccess(
          trainerList: allTrainer,
        ),
      );
    }
  }

  Future<void> _onInitLoad(InitLoad event, Emitter<TrainerState> emit) async {
    final trainersFromDB = await getTrainers.call();

    int c = 1;
    List<Trainer> allTrainer = [];
    for (var j = 1; j <= trainersFromDB.length; j++) {
      Trainer trainerFromDb = await getTrainerFullInfoById.call(j);
      List<Question> questionFromTrainer = [];
      for (var i = 1; i <= trainerFromDb.questions.length; i++) {
        Question question = await getQuestionFullInfoById.call(c);

        questionFromTrainer.add(question);
        c++;
      }
      Trainer trainer = Trainer(
        id: trainerFromDb.id,
        subjectName: trainerFromDb.subjectName,
        color: trainerFromDb.color,
        image: trainerFromDb.image,
        questions: questionFromTrainer,
        trainerName: trainerFromDb.trainerName,
        description: trainerFromDb.description,
      );
      allTrainer.add(trainer);
      questionFromTrainer = [];
    }
    if (allTrainer.isEmpty) {
      emit(
        const TrainerLoadFailure(
          errorMessage: "Ошибка инициализации",
        ),
      );
    }
    emit(
      TrainerLoadSuccess(
        trainerList: allTrainer,
      ),
    );
  }

  void _onGenerateAnswers(
      GenerateAnswersListEvent event, Emitter<TrainerState> emit) {
    final trainer = event.trainer;
    List<List<String>> answers = [];
    for (var i = 0; i < trainer.questions.length; i++) {
      answers.add(_generateRandomAnswers(trainer.questions[i].rightAnswer,
          trainer.questions[i].incorrectAnswers));
    }

    emit(
      TrainerLoadSuccess(
        currentAnswers: answers,
      ),
    );
  }

  void _onCleanCurrentAnswers(
      ClearCurrentAnswersEvent event, Emitter<TrainerState> emit) {
    emit(const TrainerLoadSuccess(
      currentAnswers: [],
    ));
  }

  List<String> _generateRandomAnswers(
      String correctAnswer, List<String> incorrectAnswers) {
    List<String> answers = [];

    answers.add(correctAnswer);

    answers.addAll(incorrectAnswers);

    answers.shuffle();

    return answers;
  }
}
