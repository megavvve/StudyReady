import 'package:study_ready/domain/entities/subject.dart';

abstract class SubjectRepository {
  Future<List<Subject>> getSubjects();
  Future<int> insertSubject(Subject subject);
  Future<int> deleteSubject(int id);
}
