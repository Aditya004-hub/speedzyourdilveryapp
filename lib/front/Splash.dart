
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:speedz/front/SignIn.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3,),() {
      Navigator.pushReplacement(context, MaterialPageRoute
        (builder: (context) => Login()));
    } );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 250,
            margin: EdgeInsets.only(top: 270,),
            alignment: FractionalOffset.center,
            child: Image.asset("content/images/logo 1.png",
              fit: BoxFit.contain,),
          ),
          Container(
            alignment: FractionalOffset.center,
            margin: EdgeInsets.only(top: 5,),
            child: Image.asset("content/images/logo 2.png",
            ),
          )
        ],
      ),
    );
  }
}

