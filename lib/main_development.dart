import 'package:carefull/carefull_app.dart';
import 'package:carefull/core/di/di.dart';

import 'package:carefull/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  setup();




  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,



);
  await ScreenUtil.ensureScreenSize();
  runApp( CarefullApp());
}
