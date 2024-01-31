import 'package:study_ready/data/external/trainers/json_trainer_repository.dart';

Future<void> initializeData() async {
  final dataRepository = JsonTrainerRepository();
   dataRepository.initializeTrainers();
}
