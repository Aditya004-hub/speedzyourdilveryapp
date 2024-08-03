import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:speedz/front/SignIn.dart';
import 'package:speedz/front/SignOut.dart';
import 'package:speedz/front/Splash.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase with custom options
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyAOuxg4tfgoaqb5NwEL-9HuDxHLKgfEfJY',
      appId: '1:155090117200:android:43ef705898d7162ffce755',
      messagingSenderId: '155090117200',
      projectId: 'sign-in-bc0fd',
      storageBucket: 'sign-in-bc0fd.appspot.com',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const  Splash(),
    );
  }
}