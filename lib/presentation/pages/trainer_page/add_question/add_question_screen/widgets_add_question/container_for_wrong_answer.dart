import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      padding: EdgeInsets.all(8.sp),
      alignment: Alignment.centerLeft,
      width: 309.w,
      //height: 70.h,
      decoration: BoxDecoration(
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                8.sp,
              ),
            ),
            child: Text(
              (widget.index + 2).toString(),
              style: TextStyle(
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
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      hintText: 'Введите неправильный ответ...',
                      hintMaxLines: 2,
                      hintStyle: TextStyle(
                        fontSize: 18.sp,
                      )),
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
