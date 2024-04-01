import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';

class DeleteTrainerScreen extends StatelessWidget {
  const DeleteTrainerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Trainer> listTrainers = [];
    return Scaffold(
      body: BlocBuilder<TrainerBloc, TrainerState>(
        builder: (context, state) {
          if (state is TrainerLoadSuccess) {
            listTrainers = state.trainerList;
          }
          return CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Delete Trainers'),
                pinned: true,
                expandedHeight: 150.0,
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
                          BlocProvider.of<TrainerBloc>(context).add(
                            DeleteTrainer(
                              trainer: trainer,
                            ),
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
        },
      ),
    );
  }
}
