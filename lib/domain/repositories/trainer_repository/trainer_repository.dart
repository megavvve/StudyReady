import 'package:study_ready/domain/entities/trainer.dart';

abstract class TrainerRepository {
  Future<int> insertTrainer(Trainer trainer);
  Future<Trainer> getTrainer(int id);
  Future<List<Trainer>> getTrainers();
  Future<Trainer> getTrainerFullInfoById(int id);
  Future<int> deleteTrainer(int id);
  Future<bool> updateTrainer(Trainer trainer);
}
