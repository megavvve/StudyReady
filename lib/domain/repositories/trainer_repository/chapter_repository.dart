import 'package:study_ready/domain/entities/chapter.dart';

abstract class ChapterRepository {
  Future<List<Chapter>> getChapters();
  Future<int> insertChapter(Chapter chapter);
  Future<int> deleteChapter(int id);
}
