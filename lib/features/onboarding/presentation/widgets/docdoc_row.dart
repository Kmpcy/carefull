import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocdocRow extends StatelessWidget {
  const DocdocRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/doc_mark.png",
          height: 90,
          alignment: Alignment.centerRight,
        ),
        SizedBox(width: 8.h),
        Image.asset("assets/images/Docdoc.png", height: 90, width: 90),
        SizedBox(width: 50.w),
      ],
    );
  }
}
