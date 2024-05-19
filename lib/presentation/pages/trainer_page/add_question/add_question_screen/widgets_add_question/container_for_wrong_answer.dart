import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:study_ready/utils/app_colors.dart';

class ContainerForWrongAnswer extends StatefulWidget {
  final int index;
  const ContainerForWrongAnswer({Key? key, required this.index})
      : super(key: key);

  @override
  _ContainerForWrongAnswerState createState() =>
      _ContainerForWrongAnswerState();
}

class _ContainerForWrongAnswerState extends State<ContainerForWrongAnswer> {
  SharedPreferences? prefs;
  late List<TextEditingController> listOfWrongAnswerControllers;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    prefs = await SharedPreferences.getInstance();

    // Здесь вы можете выполнять другие асинхронные операции, связанные с SharedPreferences
    setState(
        () {}); // вызов setState, чтобы перестроить виджет с учетом полученных данных
  }

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    TextEditingController answerController2 = TextEditingController(
        text: (prefs?.getString("answer2") != null)
            ? prefs?.getString("answer2")
            : "");
    TextEditingController answerController3 = TextEditingController(
        text: (prefs?.getString("answer3") != null)
            ? prefs?.getString("answer3")
            : "");
    TextEditingController answerController4 = TextEditingController(
        text: (prefs?.getString("answer4") != null)
            ? prefs?.getString("answer4")
            : "");
    List<TextEditingController> listOfWrongAnswerControllers = [
      answerController2,
      answerController3,
      answerController4,
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 13.w),
      alignment: Alignment.centerLeft,
      width: 309.w,
      decoration: brightness == Brightness.dark
          ? BoxDecoration(
              color: colorForMaterialCardDark,
              borderRadius: BorderRadius.circular(
                16.sp,
              ),
            )
          : BoxDecoration(
              color: const Color.fromRGBO(198, 216, 245, 1),
              borderRadius: BorderRadius.circular(
                16.sp,
              ),
            ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 30.w,
            height: 34.h,
            decoration: BoxDecoration(
              color:
                  brightness == Brightness.dark ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(
                8.sp,
              ),
            ),
            child: Text(
              (widget.index + 2).toString(),
              style: TextStyle(
                color:
                    brightness == Brightness.dark ? Colors.white : Colors.black,
                fontSize: 18.sp,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
                child: TextField(
                  textInputAction: TextInputAction.done,
                  controller: listOfWrongAnswerControllers[widget.index],
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (value) {
                    prefs?.setString("answer${widget.index + 2}", value);
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsetsDirectional.only(start: 5.w),
                    isCollapsed: true,
                    border:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Введите неправильный ответ...',
                    hintMaxLines: 2,
                    hintStyle: TextStyle(
                      color: brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                  style: TextStyle(
                    color: brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
