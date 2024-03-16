import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/domain/repositories/trainer_repository/trainer_repository.dart';

class UpdateTrainer {
  TrainerRepository trainerRepository;
  UpdateTrainer({
    required this.trainerRepository,
  });
  Future<bool> call(Trainer trainer) async {
    return await trainerRepository.updateTrainer(trainer);
  }
}
