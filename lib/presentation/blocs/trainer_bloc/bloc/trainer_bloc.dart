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
    on<ClearCurrentAnswersEvent >(_onCleanCurrentAnswers);
  }

  void _onAddQuestion(AddQuestion event, Emitter<TrainersState> emit) {
    // db.AppDB dataBase = db.AppDB();
    // final state = this.state;
    // final question = event.question;
    // final questForDb = db.QuestionsComplete(id:question.id, course: question.courseNumber, subject: question.subject, chapter: question.chapter, theme: question.theme, difficultly: question.difficultly, context: question.questionContext, rightAnswer: question.rightAnswer, incorrectAnswers: question.incorrectAnswers,);

    //     dataBase.insertQuestion(questForDb);
    //   }
    // db.insertQuestion(question);
    // emit(TrainersState(trainerList: List.from(state.trainerList)..add(question)));
  }

  Future<void> _onInitLoad(InitLoad event, Emitter<TrainersState> emit) async {
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
