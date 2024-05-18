import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/helper_bloc/helper_cubit.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';

import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/home_page/widgets/materials_button.dart';
import 'package:study_ready/presentation/pages/home_page/widgets/trainer_button.dart';
import 'package:study_ready/presentation/navigation/burger_navigation_leading.dart';
import 'package:study_ready/utils/app_colors.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';

import '../../../utils/custom_tooltip.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final TooltipController _tooltipController = TooltipController();

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    final helperDisabled = context.watch<HelperCubit>().state.disabled;
    return OverlayTooltipScaffold(
      tooltipAnimationCurve: Curves.linear,
      tooltipAnimationDuration: const Duration(milliseconds: 500),
      controller: _tooltipController,
      startWhen: (initializedWidgetLength) async {
        await Future.delayed(
          const Duration(milliseconds: 100),
        );
        return helperDisabled;
      },
      preferredOverlay: GestureDetector(
        onTap: () {
          _tooltipController.dismiss();
        },
        child: Container(
          height: double.infinity.h,
          width: double.infinity.w,
          color: const Color.fromARGB(195, 0, 0, 0),
        ),
      ),
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: brightness == Brightness.dark
              ? backgroundColorDark
              : backgroundColorLight,
          leading: Builder(
            builder: (BuildContext context) {
              return BurgerNavigationLeading(context);
            },
          ),
        ),
        drawer: const NavigatorDrawer(),
        body: Stack(
          children: [
            Positioned(
              bottom: 400.h,
              child: OverlayTooltipItem(
                displayIndex: 1,
                tooltip: (controller) {
                  return MTooltip(
                    title: 'Кнопка "Тренажер"',
                    description: "Нажмите, чтобы перейти в тренажеры.",
                    controller: controller,
                  );
                },
                child: const TrainerButtonWidget(),
              ),
            ),
            Positioned(
              bottom: 0.h,
              child: OverlayTooltipItem(
                tooltipVerticalPosition: TooltipVerticalPosition.TOP,
                displayIndex: 2,
                tooltip: (controller) {
                  return MTooltip(
                    title: 'Кнопка "Материалы"',
                    description: "Нажмите, чтобы перейти в материалы.",
                    controller: controller,
                  );
                },
                child: const MaterialsButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
