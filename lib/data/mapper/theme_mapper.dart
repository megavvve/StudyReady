import 'package:get_it/get_it.dart';
import 'package:study_ready/data/datasources/local/app_db.dart';
import 'package:study_ready/data/mapper/chapter_mapper.dart';
import 'package:study_ready/data/mapper/subject_mapper.dart';
import 'package:study_ready/domain/entities/theme.dart';

class ThemeMapper {
  AppDB appDB = GetIt.instance.get<AppDB>();
  Future<int> getNextId() async {
    // Получаем последний элемент из базы данных
    List<ThemeTableData> listThemeTableData = await appDB.getThemes();
    final last = listThemeTableData.last;

    return last.id + 1;
  }

  Future<int> getThemeIdByName(String name)  async {
    final List<ThemeTableData> themes =  await appDB.getThemes() ;
    final theme = themes.firstWhere((t) => t.name == name);
    return theme.id;
  }

  Future<ThemeTableData> getThemeById(int id) async {
    final List<ThemeTableData> themes = await appDB.getThemes();
    return themes.firstWhere((theme) => theme.id == id);
  }

  static Theme fromThemeTableData(ThemeTableData themeTableData)  {
    SubjectTableData subjectTableData =
         SubjectMapper().getSubjectById(themeTableData.subjectId) as SubjectTableData;
    ChapterTableData chapterTableData =
         ChapterMapper().getChapterById(themeTableData.chapterId) as ChapterTableData;
    return Theme(
      id: themeTableData.id,
      subject: SubjectMapper.fromSubjectTableData(subjectTableData),
      chapter: ChapterMapper.fromChapterTableData(chapterTableData),
      name: themeTableData.name,
    );
  }
}
