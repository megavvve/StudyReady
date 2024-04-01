import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:study_ready/data/datasources/local/app_db.dart';
import 'package:study_ready/data/datasources/local/external/trainers/json_trainer_repository.dart';
import 'package:study_ready/data/repositories/firebase_auth_repository.dart';
import 'package:study_ready/data/repositories/firebase_study_material_repository.dart';
import 'package:study_ready/data/repositories/trainer_repository/question_repository.dart';
import 'package:study_ready/data/repositories/trainer_repository/trainer_repository.dart';
import 'package:study_ready/domain/repositories/auth_repository.dart';
import 'package:study_ready/domain/repositories/study_material_repository.dart';
import 'package:study_ready/domain/repositories/trainer_repository/question_repository.dart';
import 'package:study_ready/domain/repositories/trainer_repository/trainer_repository.dart';
import 'package:study_ready/domain/usecases/study_material/get_study_materials.dart';
import 'package:study_ready/domain/usecases/trainer/delete_insert.dart';
import 'package:study_ready/domain/usecases/trainer/get_question_full_info_by_id.dart';
import 'package:study_ready/domain/usecases/trainer/get_trainer_full_info_by_id.dart';
import 'package:study_ready/domain/usecases/trainer/get_trainers.dart';
import 'package:study_ready/domain/usecases/trainer/insert_question.dart';
import 'package:study_ready/domain/usecases/trainer/insert_trainer.dart';
import 'package:study_ready/domain/usecases/trainer/update_trainer.dart';
import 'package:study_ready/presentation/blocs/study_material_bloc/study_material_bloc.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';

final getIt = GetIt.instance;

//Dependency injection
Future<void> setup() async {
  final AuthRepository authRepository = FirebaseAuthRepository();

// Sign in anonymously
  User? user = await authRepository.signInAnonymously();
  print(user?.email);
  //blocs

  getIt.registerFactory(
    () => StudyMaterialBloc(
      getIt(),
    )..add(
        const MaterialInitLoadEvent(),
      ),
  );

  getIt.registerFactory(
    () => TrainerBloc(
      getIt(),
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
  getIt.registerLazySingleton(
    () => DeleteInsertUseCase(
      trainerRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetStudyMaterials(studyMaterialRepository: getIt()),
  );
//Repositories
  getIt.registerLazySingleton<TrainerRepository>(
    () => TrainerRepositoryImpl(),
  );
  getIt.registerLazySingleton<QuestionRepository>(
    () => QuestionRepositoryImpl(),
  );
  getIt.registerLazySingleton<StudyMaterialRepository>(
    () => FirebaseStudyMaterialRepository(),
  );
  //Data sources
  if (!getIt.isRegistered<AppDB>()) {
    getIt.registerLazySingleton<AppDB>(() => AppDB());
  }
  //external
  final dataRepository = JsonTrainerRepository();
  dataRepository.initializeTrainers();
}
