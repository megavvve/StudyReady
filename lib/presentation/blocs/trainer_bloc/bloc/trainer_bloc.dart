import 'package:drift/drift.dart';
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
  }

  void _onAddQuestion(AddQuestion event, Emitter<TrainersState> emit) async {
    final state = this.state;
    final question = event.question;
    final questForDb = db.QuestionCompanion(
      courseNumber: Value<int>(question.courseNumber),
      subjectId: Value<int>(question.subject.length + 1),
      chapterId: const Value<int>(1),
      themeId: const Value<int>(1),
      difficultly: Value<String>(question.difficultly),
      questionContext: Value<String>(question.questionContext),
      rightAnswer: Value<String>(question.rightAnswer),
      incorrectAnswers: Value<List<String>>(question.incorrectAnswers),
    );
    //final trainersFromDB = await dataBase.getTrainers();

    if (state.trainerList.length < 3) {
      final List<String> list = [];
      list.add("${question.id}");
      final initTrainerForDB = db.TrainersCompanion(
        name: const Value<String>("Свой тренажер"),
        color: const Value<String?>(""),
        image: const Value<String?>(""),
        questions: Value<List<String>>(list),
      );
      //dataBase.insertTrainer(initTrainerForDB);

      final trainers = [
        state.trainerList[0],
        state.trainerList[1],
        Trainer(
          id: 3,
          name: "Свой тренажер",
          color: '',
          image: '',
          questions: [question],
        )
      ];

      emit(
        TrainersState(
          trainerList: trainers,
        ),
      );
    } else {
      //dataBase.insertQuestion(questForDb);
      final t = state.trainerList[1].questions;
      t.add(question);
      final trainers = [
        state.trainerList[0],
        Trainer(
            id: state.trainerList[1].id,
            name: state.trainerList[1].name,
            color: state.trainerList[1].color,
            image: state.trainerList[1].image,
            questions: t)
      ];
      final tr = [
        state.trainerList[0].questions,
        state.trainerList[1].questions
      ];
      final List<String> stringId = [];
      for (var i in tr) {
        for (var j in i) {
          stringId.add("${j.id}");
        }
      }

      dataBase.deleteTheme(2);
      final dbb = db.TrainersCompanion(
        name: const Value<String>("Свой тренажер"),
        color: const Value<String?>(""),
        image: const Value<String?>(""),
        questions: Value<List<String>>(stringId),
      );
      //dataBase.insertTrainer(dbb);

      //dataBase.insertQuestion(question);
      emit(TrainersState(trainerList: trainers));
    }
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
    
        questionFromTrainer.add(Question(
            id:quest.id,
            courseNumber:quest.course,
            subject:quest.subject,
            chapter:quest.chapter,
            theme:quest.theme,
            difficultly:quest.difficultly,
            questionContext:quest.context,
            rightAnswer:quest.rightAnswer,
            incorrectAnswers:quest.incorrectAnswers, ));
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
    emit(TrainersState(
      trainerList: allTrainers,
    ));
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
