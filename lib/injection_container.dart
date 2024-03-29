import 'package:get_it/get_it.dart';
import 'package:study_ready/data/datasources/local/app_db.dart';
import 'package:study_ready/data/datasources/local/external/trainers/json_trainer_repository.dart';
import 'package:study_ready/data/repositories/question_repository.dart';
import 'package:study_ready/data/repositories/trainer_repository.dart';
import 'package:study_ready/domain/repositories/question_repository.dart';
import 'package:study_ready/domain/repositories/trainer_repository.dart';
import 'package:study_ready/domain/usecases/get_question_full_info_by_id.dart';
import 'package:study_ready/domain/usecases/get_trainer_full_info_by_id.dart';
import 'package:study_ready/domain/usecases/get_trainers.dart';
import 'package:study_ready/domain/usecases/insert_question.dart';
import 'package:study_ready/domain/usecases/insert_trainer.dart';
import 'package:study_ready/domain/usecases/update_trainer.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';

final getIt = GetIt.instance;

//Dependency injection
Future<void> setup() async {
  

  getIt.registerFactory(
    () => TrainerBloc(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    )..add(
        const InitLoad(),
      ),
  );

  //Use cases
  getIt.registerLazySingleton(
    () => InsertTrainer(
      trainerRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => InsertQuestion(
      questionRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => UpdateTrainer(
      trainerRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetTrainers(
      trainerRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetQuestionFullInfoById(
      questionRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetTrainerFullInfoById(
      trainerRepository: getIt(),
    ),
  );
//Repositories
  getIt.registerLazySingleton<TrainerRepository>(
    () => TrainerRepositoryImpl(),
  );
  getIt.registerLazySingleton<QuestionRepository>(
    () => QuestionRepositoryImpl(),
  );
   //Data sources
   if (!getIt.isRegistered<AppDB>()) {
    getIt.registerLazySingleton<AppDB>(() => AppDB());
  }
  //external
  final dataRepository = JsonTrainerRepository();
  dataRepository.initializeTrainers();
   
}
