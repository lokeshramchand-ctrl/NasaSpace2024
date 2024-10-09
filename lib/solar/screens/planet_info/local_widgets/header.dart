import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 1,
          color: Colors.grey.withOpacity(0.5),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            DelayedDisplay(
              delay: const Duration(milliseconds: 500),
              child: Text(
                title,
                style: GoogleFonts.orbitron(color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 1,
          color: Colors.grey.withOpacity(0.4),
        ),
      ],
    );
  }
}
