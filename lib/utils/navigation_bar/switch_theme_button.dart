import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/utils/app_colors.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return Switch(
      value: brightness == Brightness.dark,
      activeColor: mainColor,
      onChanged: (bool value) {
        context.read<ThemeCubit>().setThemeBrightness(
              value ? Brightness.dark : Brightness.light,
            );
      },
    );
  }
}
