// ignore_for_file: must_be_immutable

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadingText extends StatelessWidget {
  final String text;
  late Offset? offset;

  HeadingText({super.key, required this.text, this.offset});

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      slidingBeginOffset: offset == null ? const Offset(0, 1) : offset!,
      child: Text(
        text.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 90.sp),
      ),
    );
  }
}
