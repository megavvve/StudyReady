import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_colors.dart';

class AddAnswerScreen extends StatefulWidget {
  const AddAnswerScreen({super.key});

  @override
  State<AddAnswerScreen> createState() => _AddAnswerScreenState();
}

class _AddAnswerScreenState extends State<AddAnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            Icons.menu,
            size: 50.sp,
          ),
        ),
        title: Container(
          alignment: Alignment.center,
          width: 278.w,
          height: 46.h,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(119, 165, 245, 1),
              borderRadius: BorderRadius.circular(50)),
          child: const Text('Новый вопрос'),
        ),
      ),
      body: Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  //белая карточка с названием вопроса
                  Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.topLeft,
                    width: 321.w,
                    height: 116.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Text(
                      'Название вопроса',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  //белая карточка с названием вопроса

                  //зеленая карточка введите правильный ответ
                  Positioned(
                    top: 63,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      width: 309.w,
                      height: 113.h,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 39.w,
                            height: 34.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child:
                                const Text('1', style: TextStyle(fontSize: 18)),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 241.w,
                            height: 27.h,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('Введите правильный ответ...',
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //зеленая карточка введите правильный ответ
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Column(
                children: [
                  //синяя карточка (2) введите ответ
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    width: 309.w,
                    height: 113.h,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 39.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child:
                              const Text('2', style: TextStyle(fontSize: 18)),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 241.w,
                          height: 27.h,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Введите ответ...',
                                style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //синяя карточка (2) введите ответ
                  const SizedBox(
                    height: 20,
                  ),
                  //синяя карточка (3) введите ответ
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    width: 309.w,
                    height: 113.h,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 39.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child:
                              const Text('3', style: TextStyle(fontSize: 18)),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 241.w,
                          height: 27.h,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Введите ответ...',
                                style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //синяя карточка (3) введите ответ
                  const SizedBox(
                    height: 20,
                  ),
                  //синяя карточка (4) введите ответ
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    width: 309.w,
                    height: 113.h,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 39.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child:
                              const Text('4', style: TextStyle(fontSize: 18)),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 241.w,
                          height: 27.h,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Введите ответ...',
                                style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //синяя карточка (4) введите ответ
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
