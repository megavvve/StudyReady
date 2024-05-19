import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/trainer_list_widget.dart';

class TrainerScreen extends StatefulWidget {
  const TrainerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TrainerScreen> createState() => _TrainerScreenState();
}

class _TrainerScreenState extends State<TrainerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        if (state is TrainerLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TrainerLoadSuccess) {
          // Обновляем список тренеров при успешной загрузке
          List<Trainer> trainerList = state.trainerList
              .where((element) => element.questions.isNotEmpty)
              .toList();
          return TrainerListWidget(trainerList: trainerList);
        } else if (state is TrainerLoadFailure) {
          return Center(
            child: Text(
              state.errorMessage,
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
