import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:study_ready/data/datasources/local/app_db.dart';
import 'package:study_ready/data/datasources/local/models/local_trainer_db.dart';
import 'package:study_ready/data/mapper/trainer_mapper.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/domain/repositories/trainer_repository/trainer_repository.dart';

class TrainerRepositoryImpl implements TrainerRepository {
  AppDB appDB = GetIt.instance.get<AppDB>();
  final FirebaseStorage firebaseStorage =
      FirebaseStorage.instanceFor(bucket: "gs://studyready-df819.appspot.com");

  @override
  Future<int> insertTrainer(Trainer trainer) async {
    return await appDB.insertTrainer(
      TrainerMapper.toTrainerTableCompanion(
        trainer,
      ),
    );
  }

  @override
  Future<Trainer> getTrainer(int id) async {
    TrainerTableData trainerTableData = await appDB.getTrainer(id);
    return TrainerMapper().fromTrainerTableData(trainerTableData);
  }

  @override
  Future<List<Trainer>> getTrainers() async {
    List<TrainerTableData> trainersTableData = await appDB.getTrainers();
    List<Trainer> localList =
        await TrainerMapper.fromTrainersTableData(trainersTableData, appDB);
    return localList;
  }

  @override
  Future<Trainer> getTrainerFullInfoById(int id) async {
    LocalTrainer localTrainer = await appDB.getTrainerFullInfoById(id);
    return TrainerMapper.fromLocalTrainer(localTrainer);
  }

  @override
  Future<int> deleteTrainer(int id) {
    return appDB.deleteTrainer(id);
  }

  @override
  Future<bool> updateTrainer(Trainer trainer) {
    return appDB.updateTrainer(
      TrainerMapper.toTrainerTableCompanion(
        trainer,
      ),
    );
  }
}
