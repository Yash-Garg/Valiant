import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valiant/main.dart';
import 'package:valiant/utils/password_gen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _currentSliderValue = 16.0;
  bool withLowercase = true;
  bool withUppercase = false;
  bool withNumbers = true;
  bool withSpecial = false;
  late String generatedPass;

  _genRandomPass() {
    generatedPass = generateRandomPass(
      isWithLowercase: withLowercase,
      isWithSpecial: withSpecial,
      isWithUppercase: withUppercase,
      isWithNumbers: withNumbers,
      numberCharPassword: _currentSliderValue.toInt(),
    );
  }

  @override
  void initState() {
    super.initState();
    _genRandomPass();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Valiant",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 27,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Get.toNamed('/about');
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "GENERATED PASSWORD",
                            style: TextStyle(color: textColor, fontSize: 17),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Stack(
                          children: [
                            Container(
                              height: 160,
                              decoration: new BoxDecoration(
                                color: secondaryColor,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    new BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(30),
                                alignment: Alignment.center,
                                child: Text(
                                  "$generatedPass",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily:
                                        GoogleFonts.spaceMono().fontFamily,
                                    letterSpacing: 0.6,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Material(
                                color: Colors.transparent,
                                shape: CircleBorder(),
                                clipBehavior: Clip.antiAlias,
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: IconButton(
                                    iconSize: 20,
                                    icon: Icon(Icons.content_copy),
                                    color: Colors.white,
                                    onPressed: () {
                                      FlutterClipboard.copy(generatedPass)
                                          .then((value) {
                                        Fluttertoast.showToast(
                                          msg: 'Password copied to clipboard',
                                          toastLength: Toast.LENGTH_LONG,
                                        );
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "LENGTH - ${_currentSliderValue.toInt()}",
                            style: TextStyle(color: textColor, fontSize: 17),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Container(
                          height: 70,
                          decoration: new BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "8",
                                style: TextStyle(fontSize: 17),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Slider(
                                  min: 8.0,
                                  max: 64.0,
                                  label: _currentSliderValue.round().toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      _currentSliderValue = value;
                                    });
                                  },
                                  value: _currentSliderValue,
                                ),
                              ),
                              Text(
                                "64",
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "SETTINGS",
                            style: TextStyle(color: textColor, fontSize: 17),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Container(
                          height: 70,
                          decoration: new BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Include Numbers (0-9)",
                                  style: TextStyle(fontSize: 17),
                                ),
                                CupertinoSwitch(
                                  value: withNumbers,
                                  onChanged: (value) {
                                    withNumbers = value;
                                    setState(() {
                                      value = withNumbers;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 15)),
                        Container(
                          height: 70,
                          decoration: new BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Include Lowercase Letters (a-z)",
                                  style: TextStyle(fontSize: 17),
                                ),
                                CupertinoSwitch(
                                  value: withLowercase,
                                  onChanged: (value) {
                                    withLowercase = value;
                                    setState(() {
                                      value = withLowercase;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 15)),
                        Container(
                          height: 70,
                          decoration: new BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Include Uppercase Letters (A-Z)",
                                  style: TextStyle(fontSize: 17),
                                ),
                                CupertinoSwitch(
                                  value: withUppercase,
                                  onChanged: (value) {
                                    withUppercase = value;
                                    setState(() {
                                      value = withUppercase;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 15)),
                        Container(
                          height: 70,
                          decoration: new BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Include Special Chars (@#*)",
                                  style: TextStyle(fontSize: 17),
                                ),
                                CupertinoSwitch(
                                  value: withSpecial,
                                  onChanged: (value) {
                                    withSpecial = value;
                                    setState(() {
                                      value = withSpecial;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 50,
              child: ElevatedButton(
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Color(0xFF2384F3), Colors.blue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "GENERATE PASSWORD",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _genRandomPass();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
