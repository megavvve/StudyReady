import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/home_page/widgets/materials_button.dart';
import 'package:study_ready/presentation/pages/home_page/widgets/trainer_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final blocProduct = context.read<TrainersBloc>();
    blocProduct.add(const InitLoad());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return SizedBox(
            width: 34.w,
            height: 26.h,
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 40.sp,
                  weight: 10.w,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          );
        }),
      ),
      drawer: const NavigatorDrawer(),
      body: Stack(
        children: [
          Positioned(
            bottom: 400.h,
            child: const TrainerButtonWidget(),
          ),
          Positioned(
            bottom: 0.h,
            child: const MaterialsButton(),
          ),
        ],
      ),
    );
  }
}
