import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/domain/repositories/trainer_repository.dart';

class InsertTrainer {
  TrainerRepository trainerRepository;
  InsertTrainer({
    required this.trainerRepository,
  });
  Future<int> call(Trainer trainer) async {
    return await trainerRepository.insertTrainer(trainer);
  }
}
