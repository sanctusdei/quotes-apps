import 'package:flutter/material.dart';
import 'package:staymotivated/account.dart';
import 'package:staymotivated/quote.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    Quote(),
    Accounts(),
  ];

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: tabs[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTabIndex,
        onTap: onTapped,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedIconTheme: IconThemeData(color: Colors.yellow),
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          fontFamily: 'NeoSans',
          fontSize: 12.0,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Quote',
          ),
        ],
      ),

      // body: MaterialApp(
      //   debugShowCheckedModeBanner: false,

      //   // home: Quote()
      //   home: tabs[currentTabIndex],

      // ),

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   unselectedIconTheme: IconThemeData(color: Colors.white),
      //   selectedIconTheme: IconThemeData(color: Colors.yellow),
      //   backgroundColor: Colors.black,
      //   selectedItemColor: Colors.yellow,
      //   unselectedItemColor: Colors.white,
      //   selectedLabelStyle: TextStyle(
      //     fontFamily: 'NeoSans',
      //     fontSize: 12.0,
      //   ),
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.explore),
      //       label: 'Explore',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'My Quote',
      //     ),
      //   ],
      // ),
    );
  }
}
