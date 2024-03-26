import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_ready/domain/entities/chapter.dart';

import 'package:study_ready/domain/entities/question.dart';
import 'package:study_ready/domain/entities/subject.dart';
import 'package:study_ready/domain/entities/theme.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/domain/usecases/trainer/get_question_full_info_by_id.dart';
import 'package:study_ready/domain/usecases/trainer/get_trainer_full_info_by_id.dart';
import 'package:study_ready/domain/usecases/trainer/get_trainers.dart';
import 'package:study_ready/domain/usecases/trainer/insert_question.dart';
import 'package:study_ready/domain/usecases/trainer/insert_trainer.dart';
import 'package:study_ready/domain/usecases/trainer/update_trainer.dart';

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
    on<AddTrainer>(_onAddTrainer);
  }

  void _onAddQuestion(AddQuestion event, Emitter<TrainerState> emit) async {
    final state = this.state;

    if (state is TrainerLoadSuccess) {
      final question = event.question;
      final trainer = event.trainerToAddTo;
      if (trainer != null) {
        List<Trainer> allTrainers = List.from(state.trainerList);

        int index =
            allTrainers.indexWhere((element) => element.id == trainer.id);
        if (index != -1) {
          trainer.questions
              .add(question); // Добавляем вопрос в список вопросов тренажера
          insertQuestion.call(question);
          updateTrainer.call(trainer); // Обновляем тренажера в хранилище данных

          emit(
            TrainerLoadSuccess(
              trainerList: allTrainers,
            ),
          );
        } else {
          print('Trainer with id ${trainer.id} not found.');
        }
      } else {
        insertQuestion.call(question);
      }
    } else {
      final tr = event.trainerToAddTo;
      if (tr != null) {
        tr.questions.add(event.question);
        emit(
          TrainerLoadSuccess(
            trainerList: [
              Trainer(
                id: tr.id,
                trainerName: tr.trainerName,
                subjectName: tr.subjectName,
                description: tr.description,
                color: tr.color,
                image: tr.image,
                questions: tr.questions,
              ),
            ],
          ),
        );
      }

      //нужно добавить в базу данных вопрос
    }
  }

  Future<void> _onInitLoad(InitLoad event, Emitter<TrainerState> emit) async {
    final trainersFromDB = await getTrainers.call();

    int c = 0;
    List<Trainer> allTrainer = [];
    for (var j = 0; j < trainersFromDB.length; j++) {
      // Изменение условия цикла
      Trainer trainerFromDb =
          await getTrainerFullInfoById.call(j + 1); // Добавление 1 к индексу
      List<Question> questionFromTrainer = [];
      for (var i = 0; i < trainerFromDb.questions.length; i++) {
        // Изменение условия цикла
        Question question = await getQuestionFullInfoById.call(c + 1);

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
    final trainers = event.trainerList;
    List<List<String>> answers = [];
    for (var i = 0; i < trainer.questions.length; i++) {
      answers.add(_generateRandomAnswers(trainer.questions[i].rightAnswer,
          trainer.questions[i].incorrectAnswers));
    }

    emit(
      TrainerLoadSuccess(
        trainerList: trainers,
        currentTrainersAnswers: answers,
      ),
    );
  }

  void _onCleanCurrentAnswers(
      ClearCurrentAnswersEvent event, Emitter<TrainerState> emit) {
    emit(const TrainerLoadSuccess(
      currentTrainersAnswers: [],
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

  void _onAddTrainer(AddTrainer event, Emitter<TrainerState> emit) async {
    final trainer = event.trainer;
    insertTrainer.call(trainer);
    final state = this.state;
    if (state is TrainerLoadSuccess) {
      final trainerList = state.trainerList;
      trainerList.add(trainer);
      emit(
        TrainerLoadSuccess(
          trainerList: trainerList,
        ),
      );
    }
  }
}
