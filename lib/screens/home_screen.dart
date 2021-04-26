import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:valiant/main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _sliderDiscreteValue = 32.0;

  void _shareGeneratedPassword() {
    Share.share("TODO");
  }

  @override
  void initState() {
    super.initState();
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
        actions: [IconButton(icon: Icon(Icons.info_outline), onPressed: () {})],
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
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: new BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(12)),
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
                            "LENGTH",
                            style: TextStyle(color: textColor, fontSize: 17),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "8",
                                  style: TextStyle(fontSize: 17),
                                ),
                                Container(
                                  width: 300,
                                  child: Slider(
                                    min: 8.0,
                                    max: 32.0,
                                    divisions: 24,
                                    label:
                                        _sliderDiscreteValue.round().toString(),
                                    onChanged: (value) {
                                      setState(() {
                                        _sliderDiscreteValue = value;
                                      });
                                    },
                                    value: _sliderDiscreteValue,
                                  ),
                                ),
                                Text(
                                  "32",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
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
                                  "Include Numbers",
                                  style: TextStyle(fontSize: 18),
                                ),
                                CupertinoSwitch(
                                  value: true,
                                  onChanged: (value) {},
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
                                  "Include Lowercase Letters",
                                  style: TextStyle(fontSize: 18),
                                ),
                                CupertinoSwitch(
                                  value: true,
                                  onChanged: (value) {},
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
                                  "Include Uppercase Letters",
                                  style: TextStyle(fontSize: 18),
                                ),
                                CupertinoSwitch(
                                  value: true,
                                  onChanged: (value) {},
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
                                  "Include Special Chars",
                                  style: TextStyle(fontSize: 18),
                                ),
                                CupertinoSwitch(
                                  value: true,
                                  onChanged: (value) {},
                                  activeColor: Colors.blue,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
