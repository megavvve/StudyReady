import 'package:drift/drift.dart' as drift;
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:study_ready/data/local/db/app_db.dart' as db;
import 'package:study_ready/domain/models/question.dart';
import 'package:study_ready/domain/models/trainer.dart';

part 'trainer_event.dart';
part 'trainer_state.dart';

class TrainersBloc extends Bloc<TrainerEvent, TrainersState> {
  db.AppDB dataBase = db.AppDB();
  TrainersBloc() : super(const TrainersState()) {
    on<AddQuestion>(_onAddQuestion);
    on<InitLoad>(_onInitLoad);
    on<GenerateAnswersListEvent>(_onGenerateAnswers);
    on<ClearCurrentAnswersEvent>(_onCleanCurrentAnswers);
    on<ReloadingListOfTrainersEvent>(_onReloadingListOfSimulators);
  }
  void _onReloadingListOfSimulators(
      ReloadingListOfTrainersEvent event, Emitter<TrainersState> emit) {
    final state = this.state;
    emit(
      TrainersState(
        trainerList: state.trainerList,
      ),
    );
  }

  void _onAddQuestion(AddQuestion event, Emitter<TrainersState> emit) async {
    final state = this.state;
    final question = event.question;
    List<Trainer> allTrainers = state.trainerList;

    bool trainerExists =
        allTrainers.any((trainer) => trainer.name == "Свой тренажер");

    if (trainerExists) {
      // Trainer trainer =
      //     allTrainers.firstWhere((trainer) => trainer.name == "Свой тренажер");

      // trainer.questions.add(question);
      // allTrainers.removeLast();

      // allTrainers.add(
      //   Trainer(
      //     id: trainer.id,
      //     name: trainer.name,
      //     color: trainer.color,
      //     image: trainer.image,
      //     questions: trainer.questions,
      //   ),
      // );

      // final questForDb = db.QuestionCompanion(
      //        subjectId: const drift.Value(1),
      //   chapterId: const drift.Value(1),
      //   themeId: const drift.Value(1),
      //   courseNumber: drift.Value(question.courseNumber),
      //   difficultly: drift.Value(question.difficultly),
      //   questionContext: drift.Value(question.questionContext),
      //   rightAnswer: drift.Value(question.rightAnswer),
      //   incorrectAnswers: drift.Value(question.incorrectAnswers),
      // );
      // dataBase.deleteTrainer(trainer.id);
      // List<String> questionsWithStrId = [];
      // for (var i in trainer.questions) {
      //   questionsWithStrId.add(i.id.toString());
      // }

      // final trainerForDb = db.TrainersCompanion(
      //   name: drift.Value(trainer.name),
      //   color: drift.Value(trainer.color),
      //   image: drift.Value(trainer.image),
      //   questions: drift.Value(questionsWithStrId),
      // );
      // dataBase.insertQuestion(questForDb);
      // dataBase.insertTrainer(trainerForDb);
      
    } else {
      allTrainers.add(
        Trainer(
          id: allTrainers.last.id + 1,
          name: "Свой тренажер",
          color: "0xFFE3945F",
          image: "",
          questions: [question],
        ),
      );

      final questForDb =  db.QuestionCompanion(
         subjectId: const drift.Value(1),
chapterId: const drift.Value(1),
themeId:const drift.Value(1),
        courseNumber: drift.Value(question.courseNumber),
        difficultly: drift.Value(question.difficultly),
        questionContext: drift.Value(question.questionContext),
        rightAnswer: drift.Value(question.rightAnswer),
        incorrectAnswers: drift.Value(question.incorrectAnswers),
      );
      List<String> que = [question.id.toString()];

      final trainerForDb = db.TrainersCompanion(
        name: const drift.Value("Свой тренажер"),
        color: const drift.Value("0xFFE3945F"),
        image: const drift.Value(""),
        questions: drift.Value(que),
      );
      dataBase.insertQuestion(questForDb);
      dataBase.insertTrainer(trainerForDb);
    }
    emit(
      TrainersState(
        trainerList: allTrainers,
      ),
    );
  }

  Future<void> _onInitLoad(InitLoad event, Emitter<TrainersState> emit) async {
    final tarinersFromDB = await dataBase.getTrainers();

    int c = 1;
    List<Trainer> allTrainers = [];
    for (var j = 1; j <= tarinersFromDB.length; j++) {
      final trainerFromDb = await dataBase.getTrainerFullInfoById(j);
      List<Question> questionFromTrainer = [];
      for (var i = 1; i <= trainerFromDb.questions.length; i++) {
        db.QuestionsComplete quest = await dataBase.getQuestionFullInfoById(c);

        questionFromTrainer.add(
          Question(
            id: quest.id,
            courseNumber: quest.course,
            subject: quest.subject,
            chapter: quest.chapter,
            theme: quest.theme,
            difficultly: quest.difficultly,
            questionContext: quest.context,
            rightAnswer: quest.rightAnswer,
            incorrectAnswers: quest.incorrectAnswers,
          ),
        );
        c++;
      }

      allTrainers.add(Trainer(
        id: trainerFromDb.id,
        name: trainerFromDb.name,
        color: trainerFromDb.color,
        image: trainerFromDb.image,
        questions: questionFromTrainer,
      ));
      questionFromTrainer = [];
    }
    if (allTrainers.isEmpty) {
      allTrainers = [
        Trainer(id: 3, name: "", color: "", image: "", questions: [])
      ];
    } else {}
    emit(
      TrainersState(
        trainerList: allTrainers,
      ),
    );
  }

  void _onGenerateAnswers(
      GenerateAnswersListEvent event, Emitter<TrainersState> emit) {
    final state = this.state;
    final trainer = event.trainer;
    List<List<String>> answers = [];
    for (var i = 0; i < trainer.questions.length; i++) {
      answers.add(_generateRandomAnswers(trainer.questions[i].rightAnswer,
          trainer.questions[i].incorrectAnswers));
    }

    emit(
      TrainersState(
        trainerList: state.trainerList,
        currentAnswers: answers,
      ),
    );
  }

  void _onCleanCurrentAnswers(
      ClearCurrentAnswersEvent event, Emitter<TrainersState> emit) {
    final state = this.state;

    emit(TrainersState(
      trainerList: state.trainerList,
      currentAnswers: const [],
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
