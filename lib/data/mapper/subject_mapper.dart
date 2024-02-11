import 'package:get_it/get_it.dart';
import 'package:study_ready/data/datasources/local/app_db.dart';
import 'package:study_ready/domain/entities/subject.dart';

class SubjectMapper {
  AppDB appDB = GetIt.instance.get<AppDB>();

  Future<int> getNextId() async {
    final List<SubjectTableData> listSubjectTableData =
        await appDB.getSubjects();
    final last = listSubjectTableData.last;
    return last.id + 1;
  }

  Future<int> getSubjectIdByName(String name)  async {
    final List<SubjectTableData> subjects =  await appDB.getSubjects();
    SubjectTableData  subject =
        subjects.firstWhere((s) => s.name == name);
    return subject.id;
  }
  Future<SubjectTableData> getSubjectById(int id) async {
    final List<SubjectTableData> subjects = await appDB.getSubjects();
    return subjects.firstWhere((subject) => subject.id == id);
  }
  static Subject fromSubjectTableData(SubjectTableData subjectTableData) {
    return Subject(
      id: subjectTableData.id,
      name: subjectTableData.name,
    );
  }
}
