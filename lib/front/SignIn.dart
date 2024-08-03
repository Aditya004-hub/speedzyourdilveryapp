import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:speedz/Firebase_auth_services.dart';
import '../mid/navigation.dart';
import 'SignOut.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final FirebaseAuthServices _auth= FirebaseAuthServices();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: FractionalOffset.center,
        child:SingleChildScrollView(
        child: Column(
        children: [
          // logo
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top:30,),
            child: Image.asset("content/images/logo 1.png", height: 130,),
          ),
          // welcome to speedz
          Container(
            margin: EdgeInsets.only(top: 30,),
            child: Center(
              child: Text("WELCOME TO SPEEDZ", style: TextStyle(color:
              Color.fromARGB(255, 216, 123, 63),
                fontWeight: FontWeight.bold, fontSize: 30,),),
            ),
          ),
          // login
          Container(
            margin: EdgeInsets.only(top: 15,),
            child: Center(
              child: Text("LOGIN", style: TextStyle(
                color: Color.fromARGB(255, 28, 68, 133),
                fontWeight: FontWeight.bold, fontSize: 25,),),
            ),
          ),
          // Email Id
          Container(
            margin: EdgeInsets.only(top: 35,),
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                prefixIconColor: Color.fromARGB(255, 28, 68, 133),
                label: Text("Email Id",
                  style: TextStyle(color: Color.fromARGB(255, 28, 68, 133),),),
                enabledBorder:
                OutlineInputBorder(
                  borderSide: BorderSide(
                  style: BorderStyle.solid,color: Color.fromARGB(
                    255, 28, 68, 133),
                  width: 2.0,
                ),borderRadius: BorderRadius.all(Radius.circular(15),
                ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                  style: BorderStyle.solid,color: Color.fromARGB(255, 216, 123, 63),
                  width: 1.5,),
                  borderRadius: BorderRadius.all(Radius.circular(15),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                  style: BorderStyle.solid,color: Colors.redAccent,
                  width: 1.5,),
                  borderRadius: BorderRadius.all(Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          // password
          Container(
            margin: EdgeInsets.only(top: 25,),
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password,
                  color: Color.fromARGB(255, 28, 68, 133),
                ),
                label: Text("Password",
                  style: TextStyle(color: Color.fromARGB(255, 28, 68, 133),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                  style: BorderStyle.solid,color: Color.fromARGB(
                    255, 28, 68, 133),
                  width: 2.0,
                ),borderRadius: BorderRadius.all(Radius.circular(15),
                ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                  style: BorderStyle.solid,color: Color.fromARGB(255, 216, 123, 63),
                  width: 1.5,),
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    ),
                ),
                 errorBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                   style: BorderStyle.solid,color: Colors.redAccent,
                   width: 1.5,),
                   borderRadius: BorderRadius.all(Radius.circular(15),
                   ),
                 ),
              ),
            ),
          ),
          // SignIn
          Container(
            margin: EdgeInsets.only(top: 25,),
            height: 53,
            width: 180,
            child: ElevatedButton.icon(
              onPressed: _signIn,
            label: Text(
              "Sign In", style: TextStyle(color: Colors.white,
              fontSize: 20, fontWeight: FontWeight.bold),),
              icon: Icon(
                Icons.login, color: Colors.white, size: 35,),
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 28, 68, 133),
                backgroundColor: Color.fromARGB(255, 216, 123, 63),
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius:
                BorderRadiusDirectional.all(Radius.circular(16),
                ),),
                side: BorderSide(width: 2.0,
                  color: Color.fromARGB(255, 216, 123, 63),
                ),
              ),
          ),
          ),
          // or New to speedz
          Container(
            margin: EdgeInsets.only(top: 20,),
            child: Text("Or", style: TextStyle(
                color: Color.fromARGB(255, 28, 68, 133),
                fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Container(
            height: 30,
            margin: EdgeInsets.only(top: 20,),
            child: Text("New To Speedz?", style: TextStyle(
                color: Color.fromARGB(255, 28, 68, 133),
                fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          // Sign up
          ListTile(
              minTileHeight: 1,
            onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                      (context) { return Register();
                  },
                  ), (route) => false,);
              },
            title: Text(
              "Create Your Speedz Account", style: TextStyle(
              color: Color.fromARGB(153, 216, 123, 63), fontSize: 17,
              fontWeight: FontWeight.bold,),
              textAlign: TextAlign.center,
          ),
          ),
          ],
        ),
      ),
    ),
    );
  }

  void _signIn() async{
    String email = _emailController.text;
    String password = _passwordController.text;
     User? user = await _auth.signInWithEmailAndPassword(email, password);

     if(user!=null){
       print("Successfully Sign in");
       Navigator.pushReplacement(context, MaterialPageRoute(
           builder: (context)=> Bottom()));
     }
     else{
       print("Error");
     }
     return null;
}
}
