import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/domain/repositories/trainer_repository/trainer_repository.dart';

class GetTrainerFullInfoById {
  TrainerRepository trainerRepository;
  GetTrainerFullInfoById({
    required this.trainerRepository,
  });
  Future<Trainer> call(int id) async {
    return await trainerRepository.getTrainerFullInfoById(id);
  }
}
