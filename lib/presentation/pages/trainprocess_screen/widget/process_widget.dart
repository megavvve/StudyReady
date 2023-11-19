import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_screen/trainer_screen.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class ProcessWidget extends StatefulWidget {
  final Widget child;
  const ProcessWidget({required this.child}) : super();
  static ProcessWidgetState of(BuildContext context, {bool rebuild = true}) {
    //если нам нужно только получать данные и не перестраивать конкретный виджет, то ставим rebuild = false
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
  String _myMoney = '0';
  String get myMoney => _myMoney;
  void setMyMoney(newMyMoney) {
    setState(() {
      _myMoney = newMyMoney;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      child: widget.child,
      data: this,
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final ProcessWidgetState data;
  MyInheritedWidget({
    required Widget child,
    required this.data,
  }) : super(child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class ShowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProcessWidgetState data = ProcessWidget.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text('Кнопка: ${data.myMoney} '),
        ],
      ),
    );
  }
}