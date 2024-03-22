import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/blocs/study_material_bloc/study_material_bloc.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/add_material_button.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/cards_generator.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/filter_button.dart';
import 'package:study_ready/utils/app_colors.dart';

class MaterialScreen extends StatefulWidget {
  const MaterialScreen({super.key});
  @override
  State<MaterialScreen> createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  TextEditingController searchTextController = TextEditingController();
  List<StudyMaterial> _materials = [];
  @override
  void initState() {
    super.initState();
  }

  void filter(String query) {
    List<StudyMaterial> result = [];
    if (query.isEmpty) {
      //result = testMaterials;
    } else {
      result = _materials
          .where(
            (material) => material.content.toLowerCase().contains(
                  query.toLowerCase(),
                ),
          )
          .toList();
    }
    setState(() {
      _materials = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudyMaterialBloc, StudyMaterialState>(
      builder: (context, state) {
        if (state is StudyMaterialLoadSuccess) {
          final List<StudyMaterial> materials = state.materials;
          return Scaffold(
            drawer: const NavigatorDrawer(),
            backgroundColor: backgroundColor,
            body: Stack(
              children: [
                Positioned.fill(
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        surfaceTintColor: Colors.transparent,
                        pinned: true,
                        floating: true,
                        backgroundColor: backgroundColor,
                        title: PreferredSize(
                          preferredSize: Size(290.w, 50.h),
                          child: TextField(
                            onChanged: (value) => filter(value),
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
                                      borderRadius:
                                          BorderRadius.circular(50.sp),
                                    ),
                                  )
                                : InputDecoration(
                                    contentPadding: EdgeInsets.all(8.sp),
                                    prefixIcon: const Icon(Icons.search),
                                    filled: true,
                                    fillColor: Colors.amber,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(50.sp),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const FilterButton(),
                      CardsGenerator(
                        itemsList: materials,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 56.h,
                  right: 38.w,
                  child: const AddMaterialButton(),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
              drawer: const NavigatorDrawer(),
              backgroundColor: backgroundColor,
              body: const Center(
                child: CircularProgressIndicator(),
              ));
        }
      },
    );
  }
}
