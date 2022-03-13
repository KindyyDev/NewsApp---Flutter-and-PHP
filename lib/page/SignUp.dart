
import 'dart:convert';


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kindyywebapp1/admin/Dashboard.dart';
import 'package:kindyywebapp1/page/Login.dart';
import 'package:http/http.dart' as http;

import '../main.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();

  Future signUp()async{
    var url = "http://192.168.43.203/kindyywebapp/register.php";
    var response = await http.post(url,body: {"username": user.text, "password": pass.text, "name": name.text});
    if(response.statusCode == 200){
      var userData = json.decode(response.body);
      if(userData == "ERROR"){
        showDialog(
          context: (context),
          builder: (context)=>AlertDialog(
          title: Text("Message"),
          content: Text("This User already Exit!"),
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
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(name: userData["name"],email: userData["username"]),),);
        }
        showDialog(
          context: (context),
          builder: (context)=>AlertDialog(
            title: Text("Message"),
            content: Text("Sucessful"),
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
        title: Text("Sign Up"),
      ),
      body: Stack(children: [
        Container(
          color: Colors.white24,
        ),
        Positioned(
          top: 30,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Welcome to 9ja Update", style: TextStyle(fontSize: 30, color: Colors.black87, fontWeight: FontWeight.bold),),
          ),),
        Positioned(
          top: 70,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text("Sign Up Here", style: TextStyle(fontSize: 30, color: Colors.black87, fontWeight: FontWeight.bold),),
          ),),

        Positioned(
          top: 130,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "Name",
                ),
              ),
            ),),),


        Positioned(
          top: 210,
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
          top: 300,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: pass,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
            ),),),

        Positioned(
          top: 390,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: MaterialButton(
                    color: Colors.red,
                    child: Text("Create Account",
                      style: TextStyle(fontSize: 17,
                        color: Colors.black87,),),
                    onPressed: (){
                      signUp();
                    }
                    ),
            ),),),


        // Positioned(
        //   top: 450,
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     height: 100,
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Center(
        //         child: Text("Sign Up", style: TextStyle(color: Colors.red,),
        //         ),
        //
        //       ),
        //     ),),),


        Positioned(
          top: 470,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              // ignore: deprecated_member_use
              child: RaisedButton(
                color: Colors.white,
                child: Text("Have an account? Sign In", style: TextStyle(color: Colors.red, fontSize: 18,)
                ), onPressed: (){
                debugPrint("Clicked");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(),),);
              },
              ),
            ),),),
      ],
      ),
    );
  }
}


























// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
//
// class SignUp extends StatefulWidget {
//   @override
//   _SignUpState createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sign Up"),
//       ),
//       body: Stack(children: [
//         Container(
//           color: Colors.green,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 200),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
//             ),
//             width: double.infinity,
//             child: Padding(padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Center(child: Text("Sign Up", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
//                 SizedBox(height: 10,),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xffedffee),
//                     border: UnderlineInputBorder(borderSide: BorderSide.none),
//                     labelText: "Email"
//                   ),
//                 )
//               ],
//             ),),
//           ),
//         )
//
//       ],
//       ),
//     );
//   }
// }
