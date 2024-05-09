import 'package:study_ready/domain/entities/study_material.dart';

List<StudyMaterial> sortMaterials(
    String sortBy, List<StudyMaterial> materials) {
  switch (sortBy) {
    case 'По умолчанию':
      materials.sort((a, b) => b.id.compareTo(a.id));
      break;
    case 'По названию материала':
      materials.sort((a, b) => a.fileName.compareTo(b.fileName));
      break;
    case 'По дате загрузки':
      materials.sort((a, b) => a.uploadDate.compareTo(b.uploadDate));
    case 'По типу данных':
      materials.sort((a, b) => a.fileType.compareTo(b.fileType));
    default:
      break;
  }
  return materials;
}
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