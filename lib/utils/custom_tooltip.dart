// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MTooltip extends StatefulWidget {
  final TooltipController controller;
  final String title;
  final String description;
  final String tooltipKey;

  const MTooltip({
    Key? key,
    required this.tooltipKey,
    required this.controller,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<MTooltip> createState() => _MTooltipState();
}

class _MTooltipState extends State<MTooltip> {
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initializePreferences();
  }

  Future<void> initializePreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {});
  }

  void setHelperDisabled(bool value, String key) {
    prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentDisplayIndex = widget.controller.nextPlayIndex + 1;
    final totalLength = widget.controller.playWidgetLength;
    final hasNextItem = currentDisplayIndex < totalLength;
    final hasPreviousItem = currentDisplayIndex != 1;

    return Container(
      width: size.width * .7.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      padding: EdgeInsets.all(20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: widget.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            widget.description,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 16.h,
          ),
          Divider(
            height: 1.sp,
            thickness: 1.sp,
            color: Colors.grey,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Opacity(
                opacity: hasPreviousItem ? 1 : 0,
                child: TextButton(
                  onPressed: () {
                    widget.controller.previous();
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.sp))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: const Text(
                      'Пред.',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              hasNextItem
                  ? TextButton(
                      onPressed: () {
                        widget.controller.next();
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.sp))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: const Text(
                          'След.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        setHelperDisabled(false, widget.tooltipKey);
                        widget.controller.next();
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.sp))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: const Text(
                          'ОК',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
