import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:study_ready/data/datasources/local/app_db.dart';
import 'package:study_ready/data/datasources/local/models/local_trainer_db.dart';
import 'package:study_ready/data/mapper/question_mapper.dart';
import 'package:study_ready/domain/entities/question.dart';
import 'package:study_ready/domain/entities/trainer.dart';

class TrainerMapper {
  AppDB appDB = GetIt.instance.get<AppDB>();
  static Future<Trainer> fromLocalTrainer(LocalTrainer localTrainer) async {
    final List<Future<Question>> questions = localTrainer.questions
        .map((localQuestion) async =>
            await QuestionMapper.fromLocalQuestion(localQuestion))
        .toList();

    return Trainer(
      id: localTrainer.id,
      trainerName: localTrainer.trainerName,
      subjectName: localTrainer.subjectName,
      description: localTrainer.description,
      color: localTrainer.color,
      image: localTrainer.image,
      questions: await _resolveFutures(questions),
    );
  }

  static LocalTrainer toLocalTrainer(Trainer trainer) {
    return LocalTrainer(
      id: trainer.id,
      trainerName: trainer.trainerName,
      subjectName: trainer.subjectName,
      description: trainer.description,
      color: trainer.color,
      image: trainer.image,
      questions: QuestionMapper.toLocalQuestions(
        trainer.questions,
      ),
    );
  }

  static TrainerTableCompanion toTrainerTableCompanion(Trainer trainer) {
    return TrainerTableCompanion(
      id: Value(trainer.id),
      trainerName: Value(trainer.trainerName),
      subjectName: Value(trainer.subjectName),
      description: Value(trainer.description),
      color: Value(trainer.color),
      image: Value(trainer.image),
      questions: Value(
        QuestionMapper.toStringIdList(trainer.questions),
      ),
    );
  }

  Future<Trainer> fromTrainerTableCompanion(
      TrainerTableCompanion companion) async {
    return Trainer(
      id: companion.id.value,
      trainerName: companion.trainerName.value,
      subjectName: companion.subjectName.value,
      description: companion.description.value,
      color: companion.color.value,
      image: companion.image.value,
      questions: await QuestionMapper.fromStringIds(
          companion.questions.value,
          QuestionMapper.fromLocalQuestions(await appDB.getQuestionsFullInfo())
              .cast<Question>()),
    );
  }

  Future<Trainer> fromTrainerTableData(TrainerTableData tableData) async {
    return Trainer(
      id: tableData.id,
      trainerName: tableData.trainerName,
      subjectName: tableData.subjectName,
      description: tableData.description,
      color: tableData.color,
      image: tableData.image,
      questions: await QuestionMapper.fromStringIds(
          tableData.questions,
          QuestionMapper.fromLocalQuestions(await appDB.getQuestionsFullInfo())
              .cast<Question>()),
    );
  }

  static Future<List<Trainer>> fromTrainersTableData(
      List<TrainerTableData> trainersTableData, AppDB appDB) async {
    List<Trainer> trainers = [];
    for (var tableData in trainersTableData) {
      List<Question> questions = await QuestionMapper.fromStringIds(
        tableData.questions,
        QuestionMapper.fromLocalQuestions(
          await appDB.getQuestionsFullInfo(),
        ).cast<Question>(),
      );
      Trainer trainer = Trainer(
        id: tableData.id,
        trainerName: tableData.trainerName,
        subjectName: tableData.subjectName,
        description: tableData.description,
        color: tableData.color,
        image: tableData.image,
        questions: questions,
      );
      trainers.add(trainer);
    }
    return trainers;
  }
}

Future<List<Question>> _resolveFutures(
    List<Future<Question>> futureList) async {
  // Дождитесь завершения всех futures и получите список результатов
  List<Question> questions = await Future.wait(futureList);
  return questions;
}
