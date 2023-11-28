import 'package:study_ready/domain/models/question.dart';

class Trainer {
   int id;

   String name;

   String? color;

   String? image;

  final List<Question> questions; 

  Trainer( {
    required this.id,
    required this.name,
    required this.color,
    required this.image,
    required this.questions,
  });
  

   
}

