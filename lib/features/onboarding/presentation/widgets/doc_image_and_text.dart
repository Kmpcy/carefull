
import 'package:carefull/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DocImageAndText extends StatelessWidget {
  const DocImageAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/images/docdoc_logo_low_opacity.svg",
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white.withOpacity(0.0)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.0, 0.7],
            ),
          ),
          child: Image.asset("assets/images/onboarding_doctor.png"),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 20,
          child: Text(
            "Best Doctor \nAppointment App",
            textAlign: TextAlign.center,
            style: AppStyles.blue32,
          ),
        ),
      ],
    );
  }
}