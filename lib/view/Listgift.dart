import 'package:cardhero/view/secondpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ListGift extends StatelessWidget {
  ListGift({Key key, this.data}) : super(key: key);
  final Map data;
  
  @override
  Widget build(BuildContext context) {
     return Card(
      elevation: 12.0,
      //krijimi i harkut lart te kartave
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(16.0),
      ),
      child: InkWell(
          child: Container(
            height: 200,
            width: 250,
            child: new Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20),
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new ClipRRect(
                      child: Image.network(
                        data['imagelink'] ??
                            'https://www.computerhope.com/jargon/e/error.gif:',
                        height: 97,
                        width: 90,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: new Radius.circular(16.0),
                        bottomRight: new Radius.circular(16.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:50),
                    child: QrImage(
                      data: data['qr-code'],
                      version: QrVersions.min,
                      size: 70.0
                    ),
                     ),
                  ],
                ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(left:15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data['titull'].toUpperCase(),
                        style: Theme.of(context).textTheme.title,
                      ),
                      new SizedBox(
                        height: 16.0,
                      ),
                      Padding(padding: EdgeInsets.only(left:0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, //hapsir midis tekstit
                        children: <Widget>[
                          //new Text(),
                          new Text(data['subtitle']),
                        ],
                      ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
           Navigator.push(context, MaterialPageRoute(builder:(BuildContext context){
              return Secondpage(data: data);
            }
            ));
          }),
    );
  }
   
}
