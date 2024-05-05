import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';

import '../../navigation/navigation_bar.dart';

class DeleteTrainerScreen extends StatelessWidget {
  const DeleteTrainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigatorDrawer(),
      body: BlocBuilder<TrainerBloc, TrainerState>(
        builder: (context, state) {
          if (state is TrainerLoadSuccess) {
            final listTrainers =
                state.trainerList.where((element) => element.id != 1).toList();

            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                  title: Text('Delete Trainers'),
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final trainer = listTrainers[index];
                      return ListTile(
                        title: Text(trainer.trainerName),
                        subtitle: Text(trainer.subjectName),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // Посылаем событие для удаления тренажера
                            BlocProvider.of<TrainerBloc>(context).add(
                              DeleteTrainer(trainer: trainer),
                            );
                          },
                        ),
                      );
                    },
                    childCount: listTrainers.length,
                  ),
                ),
              ],
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
