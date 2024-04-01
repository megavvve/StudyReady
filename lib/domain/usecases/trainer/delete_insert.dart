import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/domain/repositories/trainer_repository/trainer_repository.dart';

class DeleteInsertUseCase {
  TrainerRepository trainerRepository;
  DeleteInsertUseCase({
    required this.trainerRepository,
  });
  Future<int> call(Trainer trainer) async {
    return await trainerRepository.deleteTrainer(trainer.id);
  }
}
