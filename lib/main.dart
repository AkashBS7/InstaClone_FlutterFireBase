import 'package:flutter/material.dart';
import 'package:instaclone_flutterfirebase/responsive/mobile_screen_layout.dart';
import 'package:instaclone_flutterfirebase/responsive/responsive_layout_screen.dart';
import 'package:instaclone_flutterfirebase/responsive/web_screen_layout.dart';
import 'package:instaclone_flutterfirebase/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InstaClone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: const ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout()),
    );
  }
}
