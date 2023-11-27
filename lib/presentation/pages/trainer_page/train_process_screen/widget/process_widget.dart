import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

import '../../../../../utils/app_colors.dart';
import 'inherited_widget_check.dart';

class ProcessWidget extends StatefulWidget {
  final Widget child;

  const ProcessWidget({super.key, required this.child});

  static ProcessWidgetState of(BuildContext context, {bool rebuild = true}) {
    // если нам нужно только получать данные и не перестраивать конкретный виджет, то ставим rebuild = false
    if (rebuild) {
      return context
          .dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!
          .data;
    }
    return context.findAncestorWidgetOfExactType<MyInheritedWidget>()!.data;
  }

  @override
  State<StatefulWidget> createState() {
    return ProcessWidgetState();
  }
}

class ProcessWidgetState extends State<ProcessWidget> {
  String _question = '1';
  Color _color = colorForCardTrainerBlue;

  String get question => _question;
  Color get color => _color;

  void setMyQuestion(newQuestion) {
    setState(() {
      _question = newQuestion;
    });
  }

  void setColor(newColor) {
    setState(() {
      _color = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final ProcessWidgetState data;

  const MyInheritedWidget({
    super.key,
    required Widget child,
    required this.data,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class ShowWidget extends StatelessWidget {
  const ShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ProcessWidgetState data = ProcessWidget.of(context);



    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: Column(
        children: <Widget>[
          Text(
            'Вы на вопросе: ${data.question} ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}


//
/*class ButtonWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    ProcessWidgetState data = ProcessWidget.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              data.setMyQuestion('er');
            },
            child: Text('Добавить к ' + data..toString()),
          )
        ],
      ),
    );
  }

}

class ButtonWidgetNotChaned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyMoneyWidgetState data = MyMoneyWidget.of(context, rebuild: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              data.setMyMoney(data.myMoney + 200);
            },
            child: Text('Прибавить к ' + data.myMoney.toString()),
          )
        ],
      ),
    );
  }
}*/
