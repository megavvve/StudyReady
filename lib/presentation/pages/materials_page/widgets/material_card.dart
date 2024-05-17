import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/blocs/study_material_bloc/study_material_bloc.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/for_widget_of_material_screen/check_button.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/for_widget_of_material_screen/delete_mode.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/material_reader_pick.dart';
import 'package:study_ready/utils/app_colors.dart';

class MaterialCard extends StatefulWidget {
  final StudyMaterial studyMaterial;
  final DeleteMode deleteMode;
  const MaterialCard({
    required this.studyMaterial,
    Key? key,
    required this.deleteMode,
  }) : super(key: key);

  @override
  State<MaterialCard> createState() => _MaterialCardState();
}

class _MaterialCardState extends State<MaterialCard> {
  bool isPick = false;

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;

    return ListenableBuilder(
      listenable: widget.deleteMode,
      builder: (context, state) {
        return BlocBuilder<StudyMaterialBloc, StudyMaterialState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                widget.deleteMode.isDeleting
                    ? setState(() {
                        isPick = !isPick;
                      })
                    : Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MaterialReaderPick(
                            material: widget.studyMaterial,
                          ),
                        ),
                      );
                if (isPick) {
                  widget.deleteMode.studyMaterials.add(
                    widget.studyMaterial,
                  );
                } else {
                  widget.deleteMode.studyMaterials.remove(
                    widget.studyMaterial,
                  );
                }
                // if (isPick && widget.deleteMode.isDeleting == false) {
                //   final bloc = context.read<StudyMaterialBloc>();

                //   bloc.add(
                //     DeleteMaterial(
                //       studyMaterial: widget.studyMaterial,
                //     ),
                //   );
                // }
              },
              child: Stack(
                children: [
                  Card(
                    color: brightness == Brightness.dark
                        ? colorForMaterialCardDark
                        : Colors.white,
                    elevation: isPick && widget.deleteMode.isDeleting ? 8 : 1,
                    shadowColor: isPick && widget.deleteMode.isDeleting
                        ? Colors.black
                        : null,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.studyMaterial.fileName,
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              (widget.studyMaterial.uploadDate == '')
                                  ? const Text('')
                                  : Text(
                                      '${DateTime.parse(widget.studyMaterial.uploadDate).year}-${DateTime.parse(widget.studyMaterial.uploadDate).month}-${DateTime.parse(widget.studyMaterial.uploadDate).day}',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.italic),
                                    ),
                              Icon(
                                Icons.picture_as_pdf,
                                size: 30.sp,
                                color: brightness == Brightness.dark
                                    ? mainColorDark
                                    : mainColorLight,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  if (widget
                      .deleteMode.isDeleting) // Add Positioned widget here
                    Positioned(
                      top: 10,
                      left: 15,
                      child: CheckButton(
                        isChecked: isPick,
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
