import 'package:shared_preferences/shared_preferences.dart';

Future setLowerCase(bool option) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isWithLowerCase', option);
}

Future setUpperCase(bool option) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isWithUpperCase', option);
}

Future setNumbers(bool option) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isWithNumbers', option);
}

Future setSpecial(bool option) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isWithSpecial', option);
}

Future setLength(int option) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('currentLength', option);
}
