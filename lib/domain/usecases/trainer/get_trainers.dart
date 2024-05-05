import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/domain/repositories/trainer_repository/trainer_repository.dart';

class GetTrainers {
  TrainerRepository trainerRepository;
  GetTrainers({
    required this.trainerRepository,
  });
  Future<List<Trainer>> call() async {
    return await trainerRepository.getTrainers();
  }
}
