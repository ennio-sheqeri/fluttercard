import 'dart:convert';

import 'package:cardhero/view/Listgift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class PopUpClass extends StatefulWidget {
 final List data;
  const PopUpClass({Key key, this.data}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(data);
}

class _MyHomePageState extends State<PopUpClass> {
  var data;
  _MyHomePageState(this.data);
  
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
                Container(
              padding:
                  EdgeInsets.only(left: 20, bottom: 20, right: 20, top: 20),
              margin: EdgeInsets.only(top: 120),
              constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height-178),
              decoration: BoxDecoration(
                color: Color(0xFF283A62),
                gradient: LinearGradient(
                  colors: [Color(0xFF283A62), Color(0xFF283A62)],
                  stops: [0.5, 1],
                  begin: const FractionalOffset(0.5, 0.2),
                  end: const FractionalOffset(1, 1),
                  // center: Alignment(0.0, 1),
                ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), 
                    topRight: Radius.circular(30)
                  ),
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20.0,
                      ),
                  ]
              ),
              child:Container(
                margin: EdgeInsets.only(top: 10,bottom: 50),
                padding: EdgeInsets.all(40),
                constraints: BoxConstraints.expand(height: 40),
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
                  padding: EdgeInsets.only(top: 40),
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
              ),
              Container(
                margin: EdgeInsets.only(top: 270),
                constraints: BoxConstraints.expand(height: 350),
                child: _buildBody(context),
              ),
            ],
          )
        ],
      )),
    );
  }
// kthen list viewn
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
      itemBuilder: (context, index) {
        return new Padding(
          padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListGift(
            data: data[index],
          ),
        );
      },
      itemCount: data.length,
    );
  }
}
