import 'package:flutter/material.dart';

import 'drawer.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder:
          // (context) => Search()));
        },
        child: Icon(
          Icons.search,
          color: Colors.white,
          size: 40,
        ),
        backgroundColor: Color.fromARGB(255, 216, 123, 63),
        shape: OvalBorder(side: BorderSide(color: Color.fromARGB(255, 216, 123, 63),
          style: BorderStyle.solid,width: 1.0,),
        ),
      ),
      drawer: menu(context),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 216, 123, 63),
        title: Text("Home"),
        centerTitle: false,
        titleTextStyle:  TextStyle(color: Colors.white, fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        actions: [
          Icon(Icons.shopping_cart,
            size: 30, ),
          SizedBox(width: 15,),
          Icon(Icons.notifications,
            size: 30,),
          SizedBox(width: 25,
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white,),
      ),
    );
  }
}