import 'dart:convert';
import 'dart:async';
import 'package:cardhero/data/GetData.dart';
import 'package:cardhero/view/PoupCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cardhero/view/Listgift.dart';

class CardGift extends StatefulWidget {
  final List<CardGift> data;

  const CardGift({Key key, this.data}) : super(key: key);

  @override
  _CardGiftState createState() => _CardGiftState(data);
}

class _CardGiftState extends State<CardGift> {
  var data;
  _CardGiftState(this.data);

  final GetData takeData = GetData();

 
  Future<String> loadJsonDate() async {
    var jsonText = await rootBundle.loadString('assets/articles.json');
    setState(() {
      data = json.decode(jsonText);
      _loading = false;
    });
  }

  bool _loading = true;

  @override
  void initState() {
    this.loadJsonDate();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gift Card'),
      ),
     
      body: Container(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 100),
                padding: EdgeInsets.all(40),
                constraints: BoxConstraints.expand(height: 225),
                decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [Color(0xffffff00), Color(0xfff57f17)],
                        begin: const FractionalOffset(1.0, 1.0),
                        end: const FractionalOffset(0.2, 0.2),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Gift Card',
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 220),
                constraints: BoxConstraints.expand(height: 200),
                child: _buildBody(context),
              ),
              
            ],
          )
        ],
      )),
    );
  }

  _buildBody(BuildContext context) {
    if (_loading) {
      return SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.yellow : Colors.black,
            ),
          );
        },
      );
    }

    return new ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return new Padding(
          padding: EdgeInsets.all(16.0),
          child: ListGift(
            data: data[index],
          ),
        );
      },
      itemCount: data.length,
    );
  }
}
