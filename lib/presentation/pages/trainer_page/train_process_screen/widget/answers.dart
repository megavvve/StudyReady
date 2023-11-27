import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_page/train_process_screen/widget/style_for_answer.dart';

import 'inherited_widget_check.dart';

class Answers extends StatefulWidget {
  final List<String> list;

  const Answers({super.key, required this.list});

  @override
  State<Answers> createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  //int selectedButtonIndex = -1;

  @override
  Widget build(BuildContext context) {
 
    //SharedState.of(context).updateSelectedIndex(-1);
    return Column(
      children: [
        for (int i = 0; i < widget.list.length; i++)
          Column(
            children: [
              SizedBox(
                width: 320.w,
                child: ElevatedButton(
                  style: StyleForAnswer(
                      i == SharedState.of(context).selectedIndex),
                  child: Padding(
                    padding: EdgeInsets.all(14.0.sp),
                    child: Text(
                      widget.list[i],
                      style: TextStyle(
                        fontSize: 16.sp, // Размер шрифта
                        color: Colors.black, // Цвет текста
                        fontWeight: FontWeight.w400, // Жирный шрифт
                        fontStyle: FontStyle.normal, // Обычный стиль шрифта
                        letterSpacing: 0.5.sp, // Расстояние между буквами
                        wordSpacing: 1.0.sp, // Расстояние между словами
                        height: 1.5.h, // Межстрочный интервал
                        decoration:
                            TextDecoration.none, // Отсутствие украшений текста
                        decorationColor: Colors
                            .transparent, // Цвет украшений (если они есть)
                        decorationStyle:
                            TextDecorationStyle.solid, // Стиль украшений
                      ),
                    ),
                  ),
                  onPressed: () {
                    _onButtonPressed(
                      i,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 23.h,
              )
            ],
          ),
      ],
    );
  }

  Color _buttonStyle(int buttonIndex) {
    var data = SharedState.of(context);
    return (buttonIndex == data.selectedIndex)
        ? Colors.grey // Цвет выделенной кнопки
        : Colors.white;
  }

  void _onButtonPressed(int buttonIndex) {
    SharedState.of(context).updateSelectedIndex(buttonIndex);
  }
}
