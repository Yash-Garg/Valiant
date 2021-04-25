import 'dart:math';

String generateRandomPass({
  bool isWithLetters = true,
  bool isWithUppercase = true,
  bool isWithNumbers = true,
  bool isWithSpecial = false,
  int numberCharPassword = 18,
}) {
  String _lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
  String _upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String _numbers = "0123456789";
  String _special = "@#=+!£\$%&?[](){}-_";

  String _allowedChars = "";

  _allowedChars += (isWithLetters ? _lowerCaseLetters : '');
  _allowedChars += (isWithUppercase ? _upperCaseLetters : '');
  _allowedChars += (isWithNumbers ? _numbers : '');
  _allowedChars += (isWithSpecial ? _special : '');

  if (_allowedChars.length == 0) {
    return '';
  }

  int i = 0;
  String _result = "";
  while (i < numberCharPassword) {
    int randomInt = Random.secure().nextInt(_allowedChars.length);
    _result += _allowedChars[randomInt];
    i++;
  }

  return _result;
}
