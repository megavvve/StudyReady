import 'package:study_ready/data/local/db/app_db.dart' as db;
import 'package:study_ready/domain/models/question.dart';

class Trainer {
   int id;

   String name;

   //String subject;

   //String description;

   String? color;

   String? image;

  final List<Question> questions; // --> String as Json

  Trainer( {
    required this.id,
    required this.name,
    //required this.subject,
    //required this.description,
    required this.color,
    required this.image,
    required this.questions,
  });
  

   
}

