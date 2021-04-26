import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valiant/screens/home_screen.dart';
import 'package:valiant/screens/splash_screen.dart';

void main() => runApp(MyApp());

const primaryColor = Color(0xFF050f2e);
const secondaryColor = Color(0xFF091741);
const textColor = Color(0xFF7380ad);

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
        fontFamily: GoogleFonts.alata().fontFamily,
        appBarTheme: AppBarTheme(color: primaryColor),
        scaffoldBackgroundColor: primaryColor,
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.blue,
          inactiveTrackColor: Colors.white,
          trackShape: RectangularSliderTrackShape(),
          trackHeight: 3,
          thumbColor: Colors.white,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
          valueIndicatorColor: Colors.black,
        ),
      ),
    );
  }
}
