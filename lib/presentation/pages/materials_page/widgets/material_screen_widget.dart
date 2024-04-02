import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/navigation/burger_navigation_leading.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/cards_generator.dart';
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
  String curParam = "По умолчанию";
  String _query = '';
  didPop(result) {
    // Вызываем unfocus перед закрытием второй страницы
    FocusScope.of(context).unfocus();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    materials = sortMaterials(curParam, widget.materialList);
    if (searchTextController.text.isEmpty) {
      _filteredMaterials = widget.materialList;
    } else {
      _filteredMaterials = _filterMaterials(materials, _query);
    }

    return Scaffold(
      drawer: const NavigatorDrawer(),
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
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
                    backgroundColor: backgroundColor,
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
                              fillColor: secondColor,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50.sp),
                              ),
                            )
                          : InputDecoration(
                              contentPadding: EdgeInsets.all(8.sp),
                              prefixIcon: IconButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                },
                                icon: const Icon(Icons.keyboard_arrow_left),
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
                              fillColor: secondColor,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50.sp),
                              ),
                            ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20.h,
                    ),
                  ),
                  // SliverToBoxAdapter(
                  //   child: Padding(
                  //     padding: EdgeInsets.all(
                  //       8.sp,
                  //     ),
                  //     child: Align(
                  //       alignment: Alignment.center,
                  //       child: SizedBox(
                  //         height: 32.h,
                  //         width: 110.w,
                  //         child: TextButton(
                  //           style: TextButton.styleFrom(
                  //             backgroundColor: trainerAppBarButtonsBackground,
                  //             padding: EdgeInsets.symmetric(horizontal: 10.w),
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(
                  //                 10.sp,
                  //               ),
                  //             ),
                  //           ),
                  //           onPressed: () {
                  //             showModalBottomSheet(
                  //               backgroundColor: secondColor,
                  //               context: context,
                  //               builder: (BuildContext context) {
                  //                 return Column(
                  //                   mainAxisSize: MainAxisSize.min,
                  //                   children: <Widget>[
                  //                     Padding(
                  //                       padding: EdgeInsets.symmetric(
                  //                           vertical: 10.h),
                  //                       child: Text(
                  //                         "Сортировать",
                  //                         style: TextStyle(
                  //                           fontWeight: FontWeight.w400,
                  //                           fontSize: 20.sp,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     ListView.builder(
                  //                       shrinkWrap: true,
                  //                       itemCount: paramsOfSort.length,
                  //                       itemBuilder:
                  //                           (BuildContext context, int index) =>
                  //                               ListTile(
                  //                         title: Text(
                  //                           paramsOfSort[index],
                  //                         ),
                  //                         onTap: () {
                  //                           setState(() {
                  //                             curParam = paramsOfSort[index];
                  //                           });

                  //                           Navigator.pop(context);

                  //                           FocusScope.of(context).unfocus();
                  //                         },
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 );
                  //               },
                  //             );
                  //           },
                  //           child: Text(
                  //             "Сортировка",
                  //             style: TextStyle(
                  //               fontSize: 13.sp,
                  //               fontWeight: FontWeight.w400,
                  //               color: Colors.black,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10.h,
                    ),
                  ),
                  CardsGenerator(
                    itemsList: _filteredMaterials,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<StudyMaterial> _filterMaterials(
    List<StudyMaterial> materials, String query) {
  if (query.isEmpty) {
    return List.from(materials);
  } else {
    return materials
        .where(
          (material) => material.fileName.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
  }
}
