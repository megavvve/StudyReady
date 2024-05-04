import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionAndRightAnswerWidget extends StatelessWidget {
  const QuestionAndRightAnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // или любой другой виджет загрузки
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          final prefs = snapshot.data!;
          TextEditingController answerController1 = TextEditingController();
          TextEditingController questionController = TextEditingController();
          String? answer1FromPrefs = prefs.getString('answer1');
          String? questionFromPrefs = prefs.getString('question');
          if (answer1FromPrefs != null) {
            answerController1.text = answer1FromPrefs;
          }
          if (questionFromPrefs != null) {
            questionController.text = questionFromPrefs;
          }

          return Column(
            children: [
              //белая карточка с названием вопроса
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 13.w),
                alignment: Alignment.topLeft,
                width: 320.w,
                // height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.sp),
                ),
                child: TextField(
                  textInputAction: TextInputAction.done,
                  controller: questionController,
                  onChanged: (value) {
                    prefs.setString("question", value);
                  },
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsetsDirectional.only(start: 1.w),
                    isCollapsed: true,
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Введите формулировку\nвопроса...',
                    hintMaxLines: 4,
                    helperMaxLines: 2,
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              //белая карточка с названием вопроса
              SizedBox(
                height: 20.h,
              ),
              //зеленая карточка введите правильный ответ
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 13.w),
                alignment: Alignment.center,
                width: 309.w,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(204, 245, 203, 1),
                  borderRadius: BorderRadius.circular(
                    16.sp,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          8.sp,
                        ),
                      ),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(6.sp),
                        child: TextField(
                          textInputAction: TextInputAction.done,
                          controller: answerController1,
                          onChanged: (value) {
                            prefs.setString("answer1", value);
                          },
                          maxLines: null,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsetsDirectional.only(start: 5.w),
                              isCollapsed: true,
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'Введите правильный ответ...',
                              hintMaxLines: 2,
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w300,
                              )),
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
