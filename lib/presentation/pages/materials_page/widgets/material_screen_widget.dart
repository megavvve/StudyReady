import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/presentation/navigation/burger_navigation_leading.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/materials_page/add_material/add_files_screen.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/cards_generator.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/for_widget_of_material_screen/filter_materials_fun.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/sort_materials_fun.dart';
import 'package:study_ready/utils/app_colors.dart';

class MaterialScreenWidget extends StatefulWidget {
  final List<StudyMaterial> materialList;
  const MaterialScreenWidget({super.key, required this.materialList});

  @override
  State<MaterialScreenWidget> createState() => _MaterialScreenWidgetState();
}

class _MaterialScreenWidgetState extends State<MaterialScreenWidget> {
  TextEditingController searchTextController = TextEditingController();
  late List<StudyMaterial> materials;
  @override
  void initState() {
    materials = widget.materialList;

    super.initState();
  }

  final List<String> paramsOfSort = [
    'По умолчанию',
    'По названию материала',
    'По дате загрузки',
    'По типу данных',
  ];
  List<StudyMaterial> _filteredMaterials = [];
  bool isLoading = true;
  String curParam = "По умолчанию";
  String _query = '';
  didPop(result) {
    FocusScope.of(context).unfocus();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    materials = sortMaterials(curParam, widget.materialList);
    if (searchTextController.text.isEmpty) {
      _filteredMaterials = widget.materialList;
    } else {
      _filteredMaterials = filterMaterials(materials, _query);
    }

    return Scaffold(
      drawer: const NavigatorDrawer(),
      backgroundColor: brightness == Brightness.dark
          ? backgroundColorDark
          : backgroundColorLight,
      body: (!isLoading)
          ? Center(
              child: Text(
                'Загрузка...',
                style: TextStyle(
                  fontSize: 22.0.sp, // Размер шрифта
                  color: brightness == Brightness.dark
                      ? mainColorDark
                      : mainColorLight,
                ),
              ),
            )
          : Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Stack(
                  children: [
                    CustomScrollView(
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
                          backgroundColor: brightness == Brightness.dark
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
                            decoration: (searchTextController.text.isEmpty)
                                ? InputDecoration(
                                    hintText: "Поиск...",
                                    contentPadding: EdgeInsets.all(8.sp),
                                    prefixIcon: const Icon(Icons.search),
                                    filled: true,
                                    fillColor: brightness == Brightness.dark
                                        ? colorForFindTextDark
                                        : secondColorLight,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(50.sp),
                                    ),
                                  )
                                : InputDecoration(
                                    contentPadding: EdgeInsets.all(8.sp),
                                    prefixIcon: IconButton(
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                      },
                                      icon:
                                          const Icon(Icons.keyboard_arrow_left),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        searchTextController.clear();
                                        FocusScope.of(context).unfocus();
                                      },
                                      icon: const Icon(
                                        Icons.cancel_outlined,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: brightness == Brightness.dark
                                        ? colorForFindTextDark
                                        : secondColorLight,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(50.sp),
                                    ),
                                  ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 20.h,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 10.h,
                          ),
                        ),
                        CardsGenerator(
                          itemsList: _filteredMaterials,
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 20.h,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 56.h,
                      right: 38.w,
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
                                  const AddFilesScreen(),
                                ),
                              );
                              setState(() {
                                isLoading = true;
                              });
                            },
                            backgroundColor: brightness == Brightness.dark
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
                  ],
                ),
              ),
            ),
    );
  }
}
