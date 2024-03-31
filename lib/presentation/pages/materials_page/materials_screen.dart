import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/blocs/study_material_bloc/study_material_bloc.dart';
import 'package:study_ready/presentation/navigation/burger_navigation_leading.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/cards_generator.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/filter_button.dart';
import 'package:study_ready/utils/app_colors.dart';

class MaterialScreen extends StatefulWidget {
  const MaterialScreen({Key? key}) : super(key: key);

  @override
  State<MaterialScreen> createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  TextEditingController searchTextController = TextEditingController();
  List<StudyMaterial> _filteredMaterials = [];
  String _query = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudyMaterialBloc, StudyMaterialState>(
      builder: (context1, state) {
        if (state is StudyMaterialLoadSuccess) {
          final List<StudyMaterial> materials = state.materials;
          _filteredMaterials = _filterMaterials(materials, _query);

          return Scaffold(
            drawer: const NavigatorDrawer(),
            backgroundColor: backgroundColor,
            body: Stack(
              children: [
                Positioned.fill(
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
                          decoration: InputDecoration(
                            hintText: "Поиск...",
                            contentPadding: EdgeInsets.all(8.sp),
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: secondColor,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50.sp),
                            ),
                          ),
                        ),
                      ),
                      const FilterButton(),
                      CardsGenerator(
                        itemsList: _filteredMaterials,
                      ),
                    ],
                  ),
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
            ),
          );
        }
      },
    );
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
}
