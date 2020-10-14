import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Time Picker',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Date Time Picker'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentHour;
  int currentMintue;
  int currentTimeFormat;
  String format;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentHour = 1;
    currentMintue = 1;
    currentTimeFormat = 1;
    format = "";
  }

  _hourState(int currentIndex) {
    setState(() {
      currentHour = currentIndex + 1;
    });
  }

  String _getTimeFormat(int form){
    if(form == 1){
      return  "am";
    }else{
      return "pm";
    }
  }

  _minuteState(int currentIndex) {
    setState(() {
      currentMintue = currentIndex + 1;
    });
  }

  _formatState(int currentIndex) {
    setState(() {
      currentTimeFormat = currentIndex + 1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                  ),
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Flexible(
                        child: CupertinoPicker(
                          itemExtent: 40,
                          diameterRatio: 1,
                          looping: true,
                          onSelectedItemChanged: (currentIndex) {
                            _hourState(currentIndex);
                          },
                          children: hours != null
                              ? hours.map((e) {
                                  return Container(
                                    child: Text(
                                      hours[e - 1].toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  );
                                }).toList()
                              : [],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0095,
                    left: MediaQuery.of(context).size.width * 0.1,
                  ),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01),
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Text(
                    ":",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Flexible(
                        child: CupertinoPicker(
                          itemExtent: 40,
                          diameterRatio: 1,
                          looping: true,
                          onSelectedItemChanged: (currentIndex){
                            _minuteState(currentIndex);
                          },
                          children: minutes != null
                              ? minutes.map((e) {
                                  return Container(
                                    child: Text(
                                      minutes[e - 1].toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  );
                                }).toList()
                              : [],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.01,
                  ),
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: CupertinoPicker(
                    itemExtent: 40,
                    diameterRatio: 1,
                    onSelectedItemChanged: (currentIndex){
                      _formatState(currentIndex);
                    },
                    children: <Widget>[
                      Text('am',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w300)),
                      Text('pm',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w300)),
                      SizedBox(
                        height: 01,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '$currentHour : ' + '$currentMintue ' + _getTimeFormat(currentTimeFormat),
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 60,
                color: colors[_colorChanger()],
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _colorChanger(){
    var rng = new Random();
    return rng.nextInt(7);
  }

  List<Color> colors = [
    Colors.redAccent,
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.yellow,
    Colors.amber,
    Colors.indigo
  ];

  List<String> timeFormat = [
    "am",
    "pm"
  ];

  List<int> hours = [
    01,
    02,
    03,
    04,
    05,
    06,
    07,
    08,
    09,
    10,
    11,
    12,
  ];

  List<int> minutes = [
    01,
    02,
    03,
    04,
    05,
    06,
    07,
    08,
    09,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
  ];
}
