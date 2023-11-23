import 'package:study_ready/data/local/db/entity/question_entity.dart';

class Trainer {
final int id;

final String name;

final String color;

final String image;

final List<Question> questions;

Trainer({
    required this.id,
    required this.name,
    required this.color,
    required this.image,
    required this.questions,
  });
}