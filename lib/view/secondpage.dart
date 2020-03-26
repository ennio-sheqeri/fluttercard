import 'package:cardhero/Animation/Corners.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Secondpage extends StatelessWidget {
  Secondpage({Key key, this.data}) : super(key: key);
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data["titull"]),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 42.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: InkWell(
                  child: Image.network(
                    data['imagelink'] ??
                        'https://www.computerhope.com/jargon/e/error.gif:',
                    height: 200,
                    width: 380,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Container(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text(data['subtitle'],),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            Hero(
              tag: data['id'],
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                 // GetCorners(),
                  QrImage(
                      data: data['qr-code'],
                      version: QrVersions.min,
                      size: 130.0),
                ],
              ),
            ),
            Text(
              data['qr-code'],
              style: Theme.of(context).textTheme.body2,
            ),
          ],
        ),
      ),
    );
  }
}