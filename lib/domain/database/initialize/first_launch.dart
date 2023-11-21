import 'package:drift/drift.dart' as drift;
import '../../../data/local/db/app_db.dart';

class FillTables {

  AppDB db = AppDB();

  void firstAppLaunch() async {

    // functions for filling tables with default data

    // (!) for full database clean re-install app

    fillSubjects();
    fillChapters();
    fillThemes();
    exampleJoinMethod(); // demo of leftJoin for tables (in dev)
  }

  // creating test subjects

  void fillSubjects() async {
    var listOfSubjects = await db.getSubjects();
    if (listOfSubjects.isEmpty) {
      var subjects = [
        'Непрерывная математика',
        'Дискретная математика',
        'Алгебра и геометрия'
      ];

      for (int i = 0; i < subjects.length; i++) {
        var subject = SubjectsCompanion(name: drift.Value(subjects[i]));

        db.insertSubject(subject);
      }
    }

    var listOfSubjectsDebug = await db.getSubjects();
    print(listOfSubjectsDebug);
  }

  // creating test chapters

  void fillChapters() async {
    var listOfChapters = await db.getChapters();
    if (listOfChapters.isEmpty) {
      var chaptersIds = [1, 2, 3];
      var chaptersNames = ['Пределы', 'Предикаты и кванторы', 'Матрицы'];

      for (int i = 0; i < chaptersIds.length; i++) {
        var chapter = ChaptersCompanion(subjectId: drift.Value(chaptersIds[i]),
        name: drift.Value(chaptersNames[i]));

        db.insertChapter(chapter);
      }
    }

    var listOfChaptersDebug = await db.getChapters();
    print(listOfChaptersDebug);
  }

  // creating test themes

  void fillThemes() async {
    var listOfThemes = await db.getThemes();
    if (listOfThemes.isEmpty) {
      var subjectIds = [1, 2, 3];
      var chapterNames = [1, 2, 3];
      var names = ['Предел последовательности', 'Свойства предикатов', 'Матричные выражения'];

      for (int i = 0; i < subjectIds.length; i++) {
        var theme = ThemesCompanion(subjectId: drift.Value(subjectIds[i]),
            chapterId: drift.Value(chapterNames[i]),
            name: drift.Value(names[i]));

        db.insertTheme(theme);
      }
    }

    var listOfThemesDebug = await db.getThemes();
    print(listOfThemesDebug);
  }

  void exampleJoinMethod() async {

    // here we go to print whole info about every THEME, getting names of SUBJECT and CHAPTER from other tables

    var listFullThemes = await  db.themeFullInfo();

    for (var i = 0; i < listFullThemes.length; i++) {
      print((listFullThemes[i].id, listFullThemes[i].subject,
      listFullThemes[i].chapter, listFullThemes[i].name));
    }

  }

}
