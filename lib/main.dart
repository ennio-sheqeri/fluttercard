import 'package:cardhero/view/PoupCard.dart';
import 'package:cardhero/view/cardgift.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key, this.title}) : super(key: key);
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CardHero',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.yellow,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: NavigatorBar() //CardGift(),
        );
  }
}

class NavigatorBar extends StatefulWidget {
  final List data;
  const NavigatorBar({Key key, this.data}) : super(key: key);

  @override
  _NavigatorBarState createState() => _NavigatorBarState(data);
}

class _NavigatorBarState extends State<NavigatorBar> {
  var data;
  _NavigatorBarState(this.data);

  List _bootomItems = [
    {"icon": Icons.home},
    {"icon": Icons.credit_card},
    // {"icon": Icons.share},
    //  {"icon": Icons.group},
    //  {'icon': Icons.shopping_basket},
  ];
  List _pages = [
    CardGift(),
    PopUpClass(),
  ];

  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigation(context),
      body: _pages[_currentTab],
    );
  }

  _buildBottomNavigation(BuildContext context) {
    var _items = <BottomNavigationBarItem>[];
    for (var item in _bootomItems) {
      _items.add(new BottomNavigationBarItem(
        icon: new Icon(
          item['icon'],
          color: Colors.black,
        ),
        title: new Text(''),
      ));
    }
    return new BottomNavigationBar(
      currentIndex: _currentTab,
      items: _items,
      onTap: (index) {
        setState(() {
          _currentTab = index;
        });
      },
    );
  }
}
