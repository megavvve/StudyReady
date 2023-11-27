import 'package:study_ready/data/local/db/entity/question_entity.dart';

class Trainer {
   int id;

   String name;

   String subject;

   String description;

   String color;

   String image;

   List<Question> questions;
  Trainer(this.id, this.name, this.subject, this.description, this.color, this.image, this.questions);
  
}
