// import 'package:first_project/account.dart';
// import 'package:first_project/order.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _currentIndex = 0;
  final List<Widget> _page = [
    Home(),
    // Myorder(),
    // Myaccount(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,),
              label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.card_travel,size: 30,)
              ,label: 'My orders',),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded,size: 30,),
              label: 'My Acoount',),
          ]),
    );
  }
}
