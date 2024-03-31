import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/navigation/burger_navigation_leading.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/add_question_screen.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/sort_trainers_fun.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/trainer_card.dart';
import 'package:study_ready/utils/app_colors.dart';

class TrainerListWidget extends StatefulWidget {
  final List<Trainer> trainerList;

  const TrainerListWidget({
    Key? key,
    required this.trainerList,
  }) : super(key: key);

  @override
  State<TrainerListWidget> createState() => _TrainerListWidgetState();
}

class _TrainerListWidgetState extends State<TrainerListWidget> {
  late List<Trainer> sortingList;

  @override
  void initState() {
    super.initState();
    sortingList = List.from(widget.trainerList);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> paramsOfSort = [
      'По умолчанию',
      'По названию тренажера',
      'По названию предмета',
      'По количеству вопросов'
    ];
    Set<String> subjectsSet = {"По умолчанию"};
    String curSubj = "По умолчанию";
    for (Trainer trainer in widget.trainerList) {
      subjectsSet.add(trainer.subjectName);
    }
    List<String> subjectsList = subjectsSet.toList();

    return Scaffold(
      drawer: const NavigatorDrawer(),
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  leading: Builder(
                    builder: (BuildContext context) {
                      return BurgerNavigationLeading(context);
                    },
                  ),
                  backgroundColor: backgroundColor,
                  pinned: true,
                  snap: false,
                  floating: true,
                  surfaceTintColor: secondColor,
                  centerTitle: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 32.h,
                        width: 170.w,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: trainerAppBarButtonsBackground,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10.sp,
                              ),
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: trainerBottomSheetBackground,
                              context: context,
                              builder: (BuildContext context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10.h,
                                      ),
                                      child: Text(
                                        "Выбрать предмет",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20.sp),
                                      ),
                                    ),
                                    for (String subject in subjectsList)
                                      ListTile(
                                          title: Text(subject),
                                          onTap: () {
                                            setState(() {
                                              curSubj = subject;

                                              if (curSubj != "По умолчанию") {
                                                sortingList = widget.trainerList
                                                    .where((element) =>
                                                        element.subjectName ==
                                                        curSubj)
                                                    .toList();
                                              } else {
                                                sortingList =
                                                    widget.trainerList;
                                              }
                                            });
                                            Navigator.pop(context);
                                          }),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            "Выбрать предмет",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                        width: 110.w,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: trainerAppBarButtonsBackground,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10.sp,
                              ),
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: trainerBottomSheetBackground,
                              context: context,
                              builder: (BuildContext context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      child: Text(
                                        "Сортировать",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: paramsOfSort.length,
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              ListTile(
                                        title: Text(paramsOfSort[index]),
                                        onTap: () {
                                          setState(() {
                                            sortingList = sortTrainers(
                                                paramsOfSort[index],
                                                sortingList);
                                          });

                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            "Сортировка",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList.builder(
                  itemCount: sortingList.length,
                  itemBuilder: (BuildContext context, int index) => TrainerCard(
                    trainer: sortingList[index],
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30.h,
                  ),
                )
              ],
            ),
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
                    await Navigator.of(context).pushReplacement(
                      customPageRoute(
                        const AddQustionScreen(),
                      ),
                    );
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
