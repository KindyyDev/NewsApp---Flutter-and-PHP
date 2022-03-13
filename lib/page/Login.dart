

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kindyywebapp1/admin/Dashboard.dart';
import 'package:kindyywebapp1/main.dart';

import 'SignUp.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login()async{
    var url = "http://192.168.43.203/kindyywebapp/login.php";
    var response = await http.post(url,body: {"username": user.text, "password": pass.text});
    if(response.statusCode == 200){
      var userData = json.decode(response.body);
      if(userData == "ERROR"){
        showDialog(
          context: (context),
          builder: (context)=>AlertDialog(
            title: Text("Message"),
            content: Text("Username and password invalid"),
            actions: [
              // ignore: deprecated_member_use
              RaisedButton(color: Colors.red, onPressed: (){
                Navigator.pop(context);
              }, child: Text("Cancel"),)
            ],
          ),
        );
      }
      else{
        if(userData['status'] == "Admin"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard(),),);
          showDialog(
            context: (context),
            builder: (context)=>AlertDialog(
              // title: Text("Message"),
              content: Text("Welcome Admin"),
              actions: [
                // ignore: deprecated_member_use
                RaisedButton(color: Colors.red, onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Cancel"),)
              ],
            ),
          );
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(name: userData["name"],email: userData["username"],),),);
        }
        showDialog(
          context: (context),
          builder: (context)=>AlertDialog(
            title: Text("Message"),
            content: Text("Login Successful"),
            actions: [
              // ignore: deprecated_member_use
              RaisedButton(color: Colors.red, onPressed: (){
                Navigator.pop(context);
              }, child: Text("Cancel"),)
            ],
          ),
        );
        print(userData);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Stack(
        children: [
        Container(
          color: Colors.white,
        ),
        Positioned(
          top: 100,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text("Login Here", style: TextStyle(fontSize: 30, color: Colors.black87, fontWeight: FontWeight.bold,),),
          ),),

        Positioned(
            top: 200,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: user,
          decoration: InputDecoration(
            labelText: "Email",
          ),
        ),
              ),),),


        Positioned(
          top: 280,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                obscuringCharacter: "*",
                controller: pass,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
            ),),),

        Positioned(
          top: 400,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(
                color: Colors.red,
                  child: Text("Login", style: TextStyle(color: Colors.white,),),onPressed: (){
                login();
              })
            ),),),


        // Positioned(
        //   top: 450,
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     height: 100,
        //     child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Center(
        //           child: Text("Sign Up", style: TextStyle(color: Colors.red,),
        //           ),
        //
        //         ),
        //     ),),),


        Positioned(
          top: 470,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              // ignore: deprecated_member_use
              child: RaisedButton(child: Text("Don't have an account? Sign Up", style: TextStyle(color: Colors.red,)
              ), onPressed: (){
                debugPrint("Clicked");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp(),),);
              },
              ),
            ),),),

        // GestureDetector(
        //   onTap: (){
        //     Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp(),),);
        //   },
        //   child: Text("Don't have an account? Sign Up", style: TextStyle(color: Colors.red, fontSize: 15,),
        // ),
        // ),
      ],
      ),
    );
  }
}
