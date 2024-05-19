import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_ready/domain/entities/question.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'user_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db.collection('users').doc(user.uid).set(user.toMap());
    // _db.collection('users').doc(user.uid).collection("trainers");
  }

  Future<void> initializeTrainersCollection(String uid) async {
    try {
      // Создаем ссылку на коллекцию тренажеров с использованием uid пользователя
      final trainersCollection =
          FirebaseFirestore.instance.collection('trainers').doc(uid);

      // Проверяем существование документа по указанному uid
      final docSnapshot = await trainersCollection.get();
      if (!docSnapshot.exists) {
        // Если документ не существует, добавляем его
        await trainersCollection.set({});

        print(
            'Trainers collection for user with uid $uid created successfully.');
      } else {
        print('Trainers collection for user with uid $uid already exists.');
      }
    } catch (e) {
      print('Error initializing trainers collection: $e');
    }
  }

  Future<void> insertTrainerWithQuestions(Trainer trainer) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String uid = sharedPreferences.getString("uid") ?? "";

      // Получаем ссылку на коллекцию "trainers" в Firestore для данного пользователя
      CollectionReference<Map<String, dynamic>> trainersCollection =
          FirebaseFirestore.instance
              .collection('trainers')
              .doc(uid)
              .collection('trainers');

      // Добавляем тренажер в коллекцию
      DocumentReference trainerDocRef =
          await trainersCollection.add(trainer.toMap());

      // Получаем список вопросов из тренажера
      List<Question> questions = trainer.questions;

      if (questions.isNotEmpty) {
        CollectionReference<Map<String, dynamic>> questionsCollection =
            trainerDocRef.collection('questions');

        for (Question question in questions) {
          Map<String, dynamic> questionMap = question.toMap();
          await questionsCollection.add(questionMap);
        }
      } else {
        print('List of questions is empty.');
      }

      print('Trainer and questions inserted successfully!');
    } catch (e) {
      // Обработка ошибок
      print('Error inserting trainer and questions: $e');
    }
  }

  Future<List<Trainer>> getTrainersWithQuestions() async {
    List<Trainer> trainers = [];
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String uid = sharedPreferences.getString("uid") ?? "";

      // Получаем ссылку на коллекцию "trainers" в Firestore для данного пользователя
      CollectionReference<Map<String, dynamic>> trainersCollection =
          FirebaseFirestore.instance
              .collection('trainers')
              .doc(uid)
              .collection('trainers');

      // Получаем все документы из коллекции "trainers"
      QuerySnapshot<Map<String, dynamic>> trainersSnapshot =
          await trainersCollection.get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> trainerDoc
          in trainersSnapshot.docs) {
        // Преобразуем данные тренажера из документа в объект Trainer
        Trainer trainer = Trainer.fromMap(trainerDoc.data());

        // Получаем ссылку на коллекцию "questions" для данного тренажера
        CollectionReference<Map<String, dynamic>> questionsCollection =
            trainerDoc.reference.collection('questions');

        // Получаем все документы из коллекции "questions"
        QuerySnapshot<Map<String, dynamic>> questionsSnapshot =
            await questionsCollection.get();

        List<Question> questions = [];
        for (QueryDocumentSnapshot<Map<String, dynamic>> questionDoc
            in questionsSnapshot.docs) {
          // Преобразуем данные вопроса из документа в объект Question
          Question question = Question.fromMap(questionDoc.data());
          questions.add(question);
        }

        // Добавляем вопросы к тренажеру
        trainer.questions.addAll(questions);
        trainers.add(trainer);
      }
    } catch (e) {
      // Обработка ошибок
      print('Error fetching trainers and questions: $e');
    }

    return trainers;
  }

  Future<String?> insertTrainer(Trainer trainer) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String uid = sharedPreferences.getString("uid") ?? "";

      // Получаем ссылку на коллекцию "trainers" для текущего пользователя
      CollectionReference trainersCollection = FirebaseFirestore.instance
          .collection('trainers')
          .doc(uid)
          .collection('trainers');

      // Добавляем тренажер в коллекцию и получаем ссылку на документ
      DocumentReference trainerRef =
          await trainersCollection.add(trainer.toMap());

      // Добавляем вопросы в подколлекцию "questions" для добавленного тренажера
      for (Question question in trainer.questions) {
        await trainerRef.collection('questions').add(question.toMap());
      }
      // Возвращаем ID документа тренажера
      return trainerRef.id;
    } catch (e) {
      print('Error inserting trainer: $e');
      return null;
    }
  }

  Future<void> insertQuestion(String trainerId, Question question) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String uid = sharedPreferences.getString("uid") ?? "";

      // Получаем ссылку на подколлекцию "questions" для указанного тренажера
      CollectionReference questionsCollection = FirebaseFirestore.instance
          .collection('trainers')
          .doc(uid)
          .collection('trainers')
          .doc(trainerId)
          .collection('questions');

      // Добавляем вопрос в подколлекцию
      await questionsCollection.add(question.toMap());
    } catch (e) {
      print('Error inserting question: $e');
    }
  }

  Future<UserModel?> getUser(String uid) async {
    DocumentSnapshot doc = await _db.collection('users').doc(uid).get();
    return doc.exists
        ? UserModel.fromMap(doc.data() as Map<String, dynamic>)
        : null;
  }

  Future<void> updateUser(UserModel user) async {
    await _db.collection('users').doc(user.uid).update(user.toMap());
  }

  Future<void> deleteUser(String uid) async {
    await _db.collection('users').doc(uid).delete();
  }
}
