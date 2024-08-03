import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:speedz/Firebase_auth_services.dart';
import '../mid/navigation.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
   TextEditingController _usernameContoller = TextEditingController();
   TextEditingController _emailContoller = TextEditingController();
   TextEditingController _passwordContoller = TextEditingController();

   @override
   void dispose() {
    _usernameContoller.dispose();
    _emailContoller.dispose();
    _passwordContoller.dispose();
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
              // login
              Container(
                margin: EdgeInsets.only(top: 15,),
                child: Center(
                  child: Text(
                    "CREATE ACCOUNT", style: TextStyle(
                    color: Color.fromARGB(255, 28, 68, 133),
                    fontWeight: FontWeight.bold, fontSize: 30,),),
                ),
              ),
              // Name
              Container(
                margin: EdgeInsets.only(top: 25,),
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: TextFormField(
                  controller: _usernameContoller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.abc),
                    prefixIconColor: Color.fromARGB(255, 28, 68, 133),
                    label: Text("Username",
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
              // Email Id
              Container(
                margin: EdgeInsets.only(top: 25,),
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: TextFormField(
                  controller: _emailContoller,
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
              // Password
              Container(
                margin: EdgeInsets.only(top: 25,),
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: TextFormField(
                  controller: _passwordContoller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    prefixIconColor: Color.fromARGB(255, 28, 68, 133),
                    label: Text("Password",
                      style: TextStyle(color: Color.fromARGB(255, 28, 68, 133),
                      ),
                    ),
                    hintText: "At least 6 character",
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
              // signup
              Container(
                margin: EdgeInsets.only(top: 25,),
                height: 53,

                child: ElevatedButton.icon(
                  onPressed: _signup, label: Text(
                  "Create Your Speedz Account", style: TextStyle(color: Colors.white,
                    fontSize: 18, fontWeight: FontWeight.bold),),
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
            ],
          ),
        ),
      ),
    );
  }

  void _signup() async{
     String username= _usernameContoller.text;
     String email = _emailContoller.text;
     String password = _passwordContoller.text;

     User? user = await _auth.signUpWithEmailAndPassword(email, password);

     if(user != null){
       print("User is successfully created");
       Navigator.pushReplacement(context, MaterialPageRoute(
           builder: (context)=> Bottom()));
     }
     else{
       print("User Doesn't Exist");
     }
  }
}
