import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valiant/screens/home_screen.dart';
import 'package:valiant/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Valiant',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      initialRoute: "/splash",
      getPages: [
        GetPage(
          name: "/splash",
          page: () => SplashScreen(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: "/home",
          page: () => HomeScreen(),
        ),
      ],
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.openSans().fontFamily,
        appBarTheme: AppBarTheme(color: Colors.transparent),
        scaffoldBackgroundColor: Colors.black,
      ),
    );
  }
}
