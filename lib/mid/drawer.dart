import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:speedz/front/SignIn.dart';

import 'navigation.dart';

Widget menu(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        // image
        Container(height: 200,
          decoration: BoxDecoration
            (color: Color.fromARGB(255, 255, 156, 98)),
          child: Image.asset("content/images/logo 1.png",
            fit: BoxFit.contain,),
        ),
        // Home
        ListTile(
          splashColor: CupertinoColors.systemGrey2,
          selectedTileColor: CupertinoColors.systemGrey2,
          onTap: (){
            Navigator.push(context, MaterialPageRoute
              (builder: (context) => Bottom()));
          },
          title: Text("Home"),
          leading: Icon(Icons.home),
        ),
        // wallet
        ListTile(
          title: Text("Wallet"),
          leading: Icon(Icons.wallet),
        ),
        // settings
        ListTile(
          title: Text("Settings"),
          leading: Icon(Icons.settings),
        ),
        // about us
        ListTile(
          title: Text("About Us"),
          leading: Icon(Icons.newspaper),
        ),
        // Logout
        ListTile(
          onTap: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context)=>Login())
            );
          },
          title: Text("Logout"),
          leading: Icon(Icons.logout),
        ),
      ],
    ),
  );
}