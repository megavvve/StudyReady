import 'package:get_it/get_it.dart';
import 'package:study_ready/data/datasources/local/app_db.dart';
import 'package:study_ready/domain/entities/chapter.dart';

class ChapterMapper {
    AppDB appDB = GetIt.instance.get<AppDB>();


  Future<int> getNextId() async {
    final List<ChapterTableData> listChapterTableData =
        await appDB.getChapters();
    final last = listChapterTableData.last;
    return last.id + 1;
  }
    Future<int> getChapterIdByName(String name)  async {
    final List<ChapterTableData> chapters =  await appDB.getChapters() ;
    final chapter =
        chapters.firstWhere((c) => c.name == name);
    return chapter.id;
  }
  Future<ChapterTableData> getChapterById(int id) async {
    final List<ChapterTableData> chapters = await appDB.getChapters();
    return chapters.firstWhere((chapter) => chapter.id == id,
        );
  }
   static Chapter fromChapterTableData(ChapterTableData chapterTableData) {
    return Chapter(
      id: chapterTableData.id,
      subjectId: chapterTableData.subjectId,
      name: chapterTableData.name,
    );
  }
}
