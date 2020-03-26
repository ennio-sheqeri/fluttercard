import 'dart:convert';

import 'package:cardhero/data/CardData.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class GetData{
  final String jsonUrl ='assets/articles.json';
  //Future<List<CardData>>getCard()async{  
    //Response res = await get(jsonUrl);
    //if(res.statusCode == 200){
      //List<dynamic>body = jsonDecode(res.body);
      //List<CardData> dataCard=body.map((dynamic item) => CardData.fromJson(item)).toList();
      //return dataCard;
   // }
//  }
  Future<String> _loadGetDat() async{
    return await rootBundle.loadString(jsonUrl);
  }
  Future<List<CardData>> getCard() async {
    String jsonString = await _loadGetDat();
    if(jsonString != null){
    final jsonResponse = json.decode(jsonString);
    List<dynamic> body = jsonResponse;
    List<CardData> dataCard=body.map((dynamic item) => CardData.fromJson(item)).toList();
    return dataCard;
    }
  }

}