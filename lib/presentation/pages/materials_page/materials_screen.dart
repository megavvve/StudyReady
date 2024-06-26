import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/blocs/study_material_bloc/study_material_bloc.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:study_ready/presentation/navigation/burger_navigation_leading.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/materials_page/add_material/add_files_screen.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/for_widget_of_material_screen/cards_generator.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/for_widget_of_material_screen/delete_mode_for_materials.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/for_widget_of_material_screen/show_delete_confirmation.dart';

import 'package:study_ready/utils/app_colors.dart';
import 'package:study_ready/utils/custom_tooltip.dart';

class MaterialScreen extends StatefulWidget {
  const MaterialScreen({Key? key}) : super(key: key);

  @override
  State<MaterialScreen> createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  bool isLoading = true;
  String _query = '';
  late DeleteModeForMaterials deleteMode;
  late bool toogleForListOfMaterials;
  SharedPreferences prefs = GetIt.instance.get<SharedPreferences>();
  @override
  void initState() {
    super.initState();
    toogleForListOfMaterials = true;
    deleteMode = DeleteModeForMaterials();
  }

  final TextEditingController searchTextController = TextEditingController();
  final TooltipController _tooltipController = TooltipController();

  bool get materialsHelperDisabled =>
      prefs.getBool('materials_helper_disabled') ?? true;

  void setHelperDisabled(bool value) {
    prefs.setBool('materials_helper_disabled', value);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return BlocBuilder<StudyMaterialBloc, StudyMaterialState>(
      builder: (contextBloc, state) {
        if (state is StudyMaterialLoadSuccess) {
          final bloc = contextBloc.read<StudyMaterialBloc>();
          return ListenableBuilder(
            listenable: deleteMode,
            builder: (BuildContext context, Widget? child) {
              if (deleteMode.deleteMaterials) {
                deleteMode.boolForClearAllIsPick = true;
                for (StudyMaterial studyMaterial
                    in deleteMode.listOfStudyMaterialsForDeleting) {
                  bloc.add(
                    DeleteMaterial(
                      studyMaterial: studyMaterial,
                    ),
                  );
                  deleteMode.listOfStudyMaterials.remove(studyMaterial);
                }

                deleteMode.listOfStudyMaterialsForDeleting.clear();

                deleteMode.deleteMaterials = false;
              }

              deleteMode.listOfStudyMaterials = state.materials;
              return OverlayTooltipScaffold(
                tooltipAnimationCurve: Curves.linear,
                tooltipAnimationDuration: const Duration(milliseconds: 500),
                controller: _tooltipController,
                startWhen: (initializedWidgetLength) async {
                  await Future.delayed(
                    const Duration(milliseconds: 100),
                  );
                  return materialsHelperDisabled;
                },
                preferredOverlay: GestureDetector(
                  onTap: () {
                    setHelperDisabled(false);
                    _tooltipController.dismiss();
                  },
                  child: Container(
                    height: double.infinity.h,
                    width: double.infinity.w,
                    color: const Color.fromARGB(195, 0, 0, 0),
                  ),
                ),
                builder: (BuildContext context) => Scaffold(
                  drawer: const NavigatorDrawer(),
                  backgroundColor: brightness == Brightness.dark
                      ? backgroundColorDark
                      : backgroundColorLight,
                  body: (!isLoading)
                      ? Center(
                          child: Text(
                            'Загрузка...',
                            style: TextStyle(
                              fontSize: 22.0.sp,
                              color: brightness == Brightness.dark
                                  ? mainColorDark
                                  : mainColorLight,
                            ),
                          ),
                        )
                      : Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                              child: CustomScrollView(
                                slivers: [
                                  SliverAppBar(
                                    leading: Builder(
                                      builder: (BuildContext context) {
                                        return BurgerNavigationLeading(context);
                                      },
                                    ),
                                    surfaceTintColor: Colors.transparent,
                                    pinned: true,
                                    floating: true,
                                    backgroundColor:
                                        brightness == Brightness.dark
                                            ? backgroundColorDark
                                            : backgroundColorLight,
                                    centerTitle: true,
                                    title: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          _query = value;
                                        });
                                      },
                                      controller: searchTextController,
                                      decoration: (searchTextController
                                              .text.isEmpty)
                                          ? InputDecoration(
                                              hintText: "Поиск...",
                                              contentPadding:
                                                  EdgeInsets.all(8.sp),
                                              prefixIcon:
                                                  const Icon(Icons.search),
                                              filled: true,
                                              fillColor:
                                                  brightness == Brightness.dark
                                                      ? colorForFindTextDark
                                                      : secondColorLight,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50.sp),
                                              ),
                                            )
                                          : InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.all(8.sp),
                                              prefixIcon: IconButton(
                                                onPressed: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_left),
                                              ),
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  searchTextController.clear();
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                icon: const Icon(
                                                  Icons.cancel_outlined,
                                                ),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  brightness == Brightness.dark
                                                      ? colorForFindTextDark
                                                      : secondColorLight,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50.sp),
                                              ),
                                            ),
                                    ),
                                  ),
                                  SliverToBoxAdapter(
                                    child: SizedBox(
                                      height: 10.h,
                                    ),
                                  ),
                                  SliverToBoxAdapter(
                                    child: (deleteMode.isDeleting)
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  deleteMode
                                                          .boolForClearAllIsPick =
                                                      true;
                                                  deleteMode.isDeleting = false;
                                                },
                                                child: Text(
                                                  "Отменить выбор ",
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  if (deleteMode
                                                          .listOfStudyMaterialsForDeleting
                                                          .isNotEmpty &&
                                                      deleteMode.isDeleting) {
                                                    showDeleteConfirmation(
                                                        context, deleteMode);
                                                  }
                                                  deleteMode.isDeleting = false;
                                                },
                                                child: Text(
                                                  "Удалить",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ],
                                          )
                                        : OverlayTooltipItem(
                                            displayIndex: 0,
                                            tooltip: (controller) {
                                              return MTooltip(
                                                tooltipKey:
                                                    'materials_helper_disabled',
                                                title: 'Кнопка "Выбрать"',
                                                description:
                                                    "Нажмите, чтобы выбрать материал для удаления.",
                                                controller: controller,
                                              );
                                            },
                                            child: Center(
                                              child: TextButton(
                                                onPressed: () {
                                                  if (deleteMode
                                                          .listOfStudyMaterialsForDeleting
                                                          .isNotEmpty &&
                                                      deleteMode.isDeleting) {
                                                    showDeleteConfirmation(
                                                        context, deleteMode);
                                                  }
                                                  deleteMode.isDeleting = true;
                                                },
                                                child: Text(
                                                  "Выбрать",
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                  SliverToBoxAdapter(
                                    child: SizedBox(
                                      height: 10.h,
                                    ),
                                  ),
                                  CardsGenerator(
                                    query: _query,
                                    deleteMode: deleteMode,
                                  ),
                                  SliverToBoxAdapter(
                                    child: SizedBox(
                                      height: 20.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 56.h,
                              right: 38.w,
                              child: OverlayTooltipItem(
                                tooltipVerticalPosition:
                                    TooltipVerticalPosition.TOP,
                                displayIndex: 1,
                                tooltip: (controller) {
                                  return MTooltip(
                                    tooltipKey: 'materials_helper_disabled',
                                    title: 'Кнопка "Добавить материал"',
                                    description:
                                        "Нажмите, чтобы перейти к добавлению материала.",
                                    controller: controller,
                                  );
                                },
                                child: SizedBox(
                                  width: 70.w,
                                  height: 70.h,
                                  child: FittedBox(
                                    child: FloatingActionButton(
                                      onPressed: () async {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        await Navigator.of(context).push(
                                          customPageRoute(
                                            AddFilesScreen(
                                              deleteMode: deleteMode,
                                            ),
                                          ),
                                        );
                                        setState(() {
                                          isLoading = true;
                                        });
                                      },
                                      backgroundColor:
                                          brightness == Brightness.dark
                                              ? colorForButton
                                              : Colors.white,
                                      child: Icon(
                                        Icons.add,
                                        color: brightness == Brightness.dark
                                            ? Colors.white
                                            : Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              );
            },
          );
        } else if (state is StudyMaterialError) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const Text(
                  "Не удалось получить данные при первом входе в приложение.\nПожалуйста, проверьте подключение к интернету.",
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            drawer: const NavigatorDrawer(),
            backgroundColor: brightness == Brightness.dark
                ? backgroundColorDark
                : backgroundColorLight,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
