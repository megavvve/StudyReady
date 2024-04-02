// Database methods class
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:study_ready/data/datasources/local/entity/chapter_table_entity.dart';
import 'package:study_ready/data/datasources/local/entity/materials_table_entity.dart';
import 'package:study_ready/data/datasources/local/entity/question_table_entity.dart';
import 'package:study_ready/data/datasources/local/entity/subject_table_entity.dart';
import 'package:study_ready/data/datasources/local/entity/themes_table_entity.dart';
import 'package:study_ready/data/datasources/local/entity/trainer_table_entity.dart';
import 'package:study_ready/data/datasources/local/models/local_question_db.dart';
import 'package:study_ready/data/datasources/local/models/theme_db.dart';
import 'package:study_ready/data/datasources/local/models/local_trainer_db.dart';
import 'entity/strings_list_json_converter.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
part 'app_db.g.dart';

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [
  SubjectTable,
  ChapterTable,
  ThemeTable,
  QuestionTable,
  TrainerTable,
  MaterialsTable
])
class AppDB extends _$AppDB {
  AppDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> deleteAndRegenerateDatabase() async {
    // Close the existing database connection
    await close();

    // Get the application documents directory
    final dbFolder = await getApplicationDocumentsDirectory();

    // Create a File object for the database file
    final file = File(path.join(dbFolder.path, 'learning.sqlite'));

    // Delete the database file
    if (await file.exists()) {
      await file.delete();
    }
  }

// Methods for Subjects
// Add new Subject
  Future<int> insertSubject(SubjectTableCompanion entity) async {
    return await into(subjectTable).insert(entity);
  }

  // Get list of Subject
  Future<List<SubjectTableData>> getSubjects() async {
    return await select(subjectTable).get();
  }

  // Delete Subject by id
  Future<int> deleteSubject(int id) async {
    return await (delete(subjectTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  // Methods for Chapters

  // Get list of chapters
  Future<List<ChapterTableData>> getChapters() async {
    return await select(chapterTable).get();
  }

  // Add new Chapter
  Future<int> insertChapter(ChapterTableCompanion entity) async {
    return await into(chapterTable).insert(entity);
  }

  // Delete Chapter by id
  Future<int> deleteChapter(int id) async {
    return await (delete(chapterTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  // Methods for Themes

  // Get list of themes
  Future<List<ThemeTableData>> getThemes() async {
    return await select(themeTable).get();
  }

  // Add new Theme
  Future<int> insertTheme(ThemeTableCompanion entity) async {
    return await into(themeTable).insert(entity);
  }

  // Delete Theme by id
  Future<int> deleteTheme(int id) async {
    return await (delete(themeTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  // Whole info about theme
  Future<List<LocalTheme>> themeFullInfo() async {
    // create aliases for the geoPoints table so that we can reference it twice
    final subject = alias(subjectTable, 's');
    final chapter = alias(chapterTable, 'c');

    final rows = await select(themeTable).join([
      innerJoin(subject, subject.id.equalsExp(themeTable.subjectId)),
      innerJoin(chapter, chapter.id.equalsExp(themeTable.chapterId)),
    ]).get();

    return rows.map((resultRow) {
      return LocalTheme(
        id: resultRow.readTable(themeTable).id,
        subject: resultRow.readTable(subject).name,
        chapter: resultRow.readTable(chapter).name,
        name: resultRow.readTable(themeTable).name,
      );
    }).toList();
  }

  // Methods for Questions table

  // Get question fill info join subjects, chapters, themes
  Future<List<LocalQuestion>> getQuestionsFullInfo() async {
    final subject = alias(subjectTable, 's');
    final chapter = alias(chapterTable, 'c');
    final theme = alias(themeTable, 't');

    final rows = await select(questionTable).join([
      innerJoin(subject, subject.id.equalsExp(questionTable.subjectId)),
      innerJoin(chapter, chapter.id.equalsExp(questionTable.chapterId)),
      innerJoin(theme, theme.id.equalsExp(questionTable.themeId)),
    ]).get();

    return rows.map((resultRow) {
      return LocalQuestion(
          id: resultRow.readTable(questionTable).id,
          course: resultRow.readTable(questionTable).courseNumber,
          subject: resultRow.readTable(subject).name,
          chapter: resultRow.readTable(chapter).name,
          theme: resultRow.readTable(theme).name,
          difficultly: resultRow.readTable(questionTable).difficultly,
          context: resultRow.readTable(questionTable).questionContext,
          rightAnswer: resultRow.readTable(questionTable).rightAnswer,
          incorrectAnswers:
              resultRow.readTable(questionTable).incorrectAnswers);
    }).toList();
  }

  Future<LocalQuestion> getQuestionFullInfoById(int id) async {
    final subject = alias(subjectTable, 's');
    final chapter = alias(chapterTable, 'c');
    final theme = alias(themeTable, 't');

    final query = select(questionTable).join([
      innerJoin(subject, subject.id.equalsExp(questionTable.subjectId)),
      innerJoin(chapter, chapter.id.equalsExp(questionTable.chapterId)),
      innerJoin(theme, theme.id.equalsExp(questionTable.themeId)),
    ]);

    query.where(questionTable.id.equals(id));

    //final result = await query.watch().take(1).first;

    return query.watch().take(1).map((resultRow) {
      return LocalQuestion(
          id: resultRow.single.readTable(questionTable).id,
          course: resultRow.single.readTable(questionTable).courseNumber,
          subject: resultRow.single.readTable(subject).name,
          chapter: resultRow.single.readTable(chapter).name,
          theme: resultRow.single.readTable(theme).name,
          difficultly: resultRow.single.readTable(questionTable).difficultly,
          context: resultRow.single.readTable(questionTable).questionContext,
          rightAnswer: resultRow.single.readTable(questionTable).rightAnswer,
          incorrectAnswers:
              resultRow.single.readTable(questionTable).incorrectAnswers);
    }).first;
  }

  // Clear all data from the database
  Future<void> clearDatabase() async {
    await transaction(() async {
      await delete(subjectTable).go();
      await delete(chapterTable).go();
      await delete(themeTable).go();
      await delete(questionTable).go();
      await delete(trainerTable).go();
    });
  }

  // Get question by id
  Future<QuestionTableData> getQuestion(int id) async {
    return await (select(questionTable)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  // Update question with new entity
  Future<bool> updateQuestion(QuestionTableCompanion entity) async {
    return await update(questionTable).replace(entity);
  }

  // Add new Question
  Future<int> insertQuestion(QuestionTableCompanion entity) async {
    return await into(questionTable).insert(entity);
  }

  // Delete Question by id
  Future<int> deleteQuestion(int id) async {
    return await (delete(questionTable)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  // Trainers

  // Add new Trainer
  Future<int> insertTrainer(TrainerTableCompanion entity) async {
    return await into(trainerTable).insert(entity);
  }

  // Get Trainer by id
  Future<TrainerTableData> getTrainer(int id) async {
    return await (select(trainerTable)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  // Get full Trainer info (questions with ids)
  Future<List<TrainerTableData>> getTrainers() async {
    return await select(trainerTable).get();
  }

  // Get full LocalTrainer objects
  Future<LocalTrainer> getTrainerFullInfoById(int id) async {
    TrainerTableData trainerBase = await getTrainer(id);
    var questions = trainerBase.questions;
    List<LocalQuestion> questionsFull = [];

    if (questions.isNotEmpty) {
      for (int i = 0; i < questions.length; i++) {
        var q = await getQuestionFullInfoById(int.parse(questions[i]));
        questionsFull.add(q);
      }
    }

    return LocalTrainer(
        id: trainerBase.id,
        trainerName: trainerBase.trainerName,
        subjectName: trainerBase.subjectName,
        color: trainerBase.color,
        image: trainerBase.image,
        questions: questionsFull,
        description: trainerBase.description);
  }

  Future<int> deleteTrainer(int id) async {
    // First, delete the trainer
    final deletedTrainersCount =
        await (delete(trainerTable)..where((tbl) => tbl.id.equals(id))).go();

    // Return the count of deleted trainers
    return deletedTrainersCount;
  }

  Future<void> deleteQuestionsByTrainerId(int trainerId) async {
    await (delete(questionTable)..where((tbl) => tbl.id.equals(trainerId)))
        .go();
  }

  //Update trainer with new entity
  Future<bool> updateTrainer(TrainerTableCompanion entity) async {
    return await update(trainerTable).replace(entity);
  }

  // Methods for Materials

  //Get whole info about Materials (list materials) (OLD, DEPRECATED)!
  // Future<List<LocalMaterial>> materialsFullInfo() async {
  //   final subject = alias(subjectTable, 's');
  //
  //   final rows = await select(materialsTable).join([
  //     innerJoin(subject, subject.id.equalsExp(materialsTable.subjectId)),
  //   ]).get();
  //
  //   return rows.map((resultRow) {
  //     return LocalMaterial(
  //       id: resultRow.readTable(materialsTable).id,
  //       name: resultRow.readTable(materialsTable).name,
  //       subject: resultRow.readTable(subject).name,
  //       context: resultRow.readTable(materialsTable).context,
  //     );
  //   }).toList();
  // }

  // Get single material full info by id (OLD, DEPRECATED)!
  // Future<LocalMaterial> getMaterialFullInfoById(int id) async {
  //   final subject = alias(subjectTable, 's');
  //
  //   final query = select(materialsTable).join([
  //     innerJoin(subject, subject.id.equalsExp(materialsTable.subjectId)),
  //   ]);
  //
  //   query.where(materialsTable.id.equals(id));
  //
  //   return query.watchSingle().map((resultRow) {
  //     return LocalMaterial(
  //         id: resultRow.readTable(materialsTable).id,
  //         name: resultRow.readTable(materialsTable).name,
  //         subject: resultRow.readTable(subject).name,
  //         context: resultRow.readTable(materialsTable).context);
  //   }).first;
  // }

  // Get list of materials
  Future<List<MaterialsTableData>> getMaterials() async {
    return await select(materialsTable).get();
  }

  // Get material by id
  Future<MaterialsTableData> getMaterial(int id) async {
    return await (select(materialsTable)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  // Adding Material
  Future<int> insertMaterial(MaterialsTableCompanion entity) async {
    return await into(materialsTable).insert(entity);
  }

  // Delete Material by id
  Future<int> deleteMaterial(int id) async {
    return await (delete(materialsTable)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
