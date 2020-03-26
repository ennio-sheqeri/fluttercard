import 'dart:async';

import 'package:flutter/material.dart';

class GetCorners extends StatefulWidget {
  @override
  _GetCornersState createState() => _GetCornersState();
}

class _GetCornersState extends State<GetCorners> {
  bool showCorner = false;
  @override
  Widget build(BuildContext context) {
   // bool showCorner= true;
           return AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          width: showCorner ? 80 : 290,
          height: showCorner ? 80 : 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: showCorner ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RotatedBox(
                  quarterTurns: 0,
                  child: Image.asset(
                    "images/corners.png",
                    width: 60.0,
                  )),
              RotatedBox(
                  quarterTurns: 1,
                  child: Image.asset(
                    "images/corners.png",
                    width: 60.0,
                  )),
            ],
          ),
          Spacer(),
          Row(
            mainAxisSize: showCorner ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RotatedBox(
                  quarterTurns: 3,
                  child: Image.asset(
                    "images/corners.png",
                    width: 60.0,
                  )),
              RotatedBox(
                  quarterTurns: 2,
                  child: Image.asset(
                    "images/corners.png",
                    width: 60.0,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    startTimer();
  }

  startTimer() {
    var duration = Duration(milliseconds: 300);
    Timer(duration, showCorners);
  }

  showCorners() {
    setState(() {
      showCorner = true;
    });
  }

  //void setState(Null Function() param0) {}
}
