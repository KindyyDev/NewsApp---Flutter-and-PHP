import 'package:flutter/material.dart';
import 'package:kindyywebapp1/admin/categoryDetails.dart';
import 'package:kindyywebapp1/admin/postDetails.dart';
import 'package:kindyywebapp1/page/Login.dart';
import 'package:kindyywebapp1/page/SignUp.dart';

import '../main.dart';

class Dashboard extends StatefulWidget {
  final name;
  final username;
  Dashboard({this.name = "Guest", this.username = ""});
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override

  Widget build(BuildContext context) {

    Widget menuDrawer(){
      return Drawer(child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          //decoration: BoxDecoration(color: Colors.pink),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            accountName: Text(widget.name),
            accountEmail: Text(widget.username)),
        ListTile(
          title: Text("Home", style: TextStyle(color: Colors.black87, fontSize: 17),),
          leading: Icon(Icons.home),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(),),);
            debugPrint("Home");
          },
        ),





        ListTile(
          title: Text("Sign up"),
          leading: Icon(Icons.seven_k),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp(),),);
            debugPrint("Sign Up");
          },
        ),
        ListTile(
          title: Text("Add Category"),
          leading: Icon(Icons.label),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryDetails(),),);
            debugPrint("Add Category");
          },
        ),

        ListTile(
          title: Text("Add Post"),
          leading: Icon(Icons.label),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PostDetails(),),);
            debugPrint("Add Post");
          },
        ),


        widget.name == "Guest" ?

        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(),),);
            debugPrint("Login");
          },
          leading: Icon(Icons.lock),
          title: Text("Login"),

        ) : ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(),),);
            debugPrint("Login");
          },
          leading: Icon(Icons.lock_open),
          title: Text("Logout"),

        )  ,

      ],),);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      drawer: menuDrawer(),
      body: Container(),
    );
  }
}


