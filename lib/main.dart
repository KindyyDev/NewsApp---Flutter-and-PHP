

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_admob/firebase_admob.dart';
// import 'package:admob_flutter/admob_flutter.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:kindyywebapp1/TopPostCard.dart';
import 'package:kindyywebapp1/page/Login.dart';
import 'package:kindyywebapp1/page/SignUp.dart';
import 'package:kindyywebapp1/page/aboutUs.dart';
import 'package:kindyywebapp1/page/contactDeveloper.dart';
// import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'CategoryListItem.dart';
import 'RecentPostItem.dart';
// import 'ad_manager.dart';

// const String testDevice = 'Kris';
// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   BannerAd createBannerAd() {
//     return BannerAd(
//       adUnitId: BannerAd.testAdUnitId,
//       size: AdSize.banner,
//       listener: (MobileAdEvent event) {
//         print("BannerAd event $event");
//       },
//     );
//   }
//   await Firebase.initializeApp();
//   FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
//   createBannerAd()
//     ..load()
//     ..show();
//   runApp(MyApp());
// }
void main()  => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final name;
  final email;
  MyHomePage({this.name = "Guest", this.email = ""});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Widget _currentAd=SizedBox(
  //   height: 0.0,
  //   width: 0.0,
  // );

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     _currentAd = FacebookBannerAd(
  //       bannerSize: BannerSize.STANDARD,
  //       listener: (result,value) {
  //         print("BannerAd:$result--> $value");
  //       }
  //     );
  //   });
  //   FacebookAudienceNetwork.init(
  //     testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6",
  //   );
  // }
  var curdate = DateFormat("d MMMM, y").format(DateTime.now());

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
            accountEmail: Text(widget.email)),
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
          title: Text("About Us"),
          leading: Icon(Icons.label),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs(),),);
            debugPrint("About Us");
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

        ),

        ListTile(
          leading: Icon(Icons.person),
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactDev(),),);
      },
          title: Text("Contact Developer"),
        ),

      ],),);
    }

    return Scaffold(
      appBar: AppBar(
        // title: Text("9ja Update", style: TextStyle(color: Colors.black87, fontSize: 25),),
        // centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.red,
        actions: <Widget>[
          Container(
            width: 150,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search",
                prefixIcon: Icon(Icons.search, color: Colors.green,),
              ),
            ),
          ),
        ],
      ),

      drawer: menuDrawer(),
        body:
        ListView(
          children: <Widget>[
            Container(

              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Instablog9ja", style: TextStyle(fontSize: 30, fontFamily: "Antonio", fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Row(
            children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("News, Entertainment, Comedy...", style: TextStyle(fontSize: 15, fontFamily: "Antonio",),
              ),
            ),

            ],
            ),

            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(curdate, style: TextStyle(fontSize: 22, fontFamily: "Antonio", color: Colors.red),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.today_sharp),
                ),
              ],
            ),

            // TopPostCard(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(child: Text("Categories", style: TextStyle(fontSize: 20, fontFamily: "Antonia"),),),
            ),

            CategoryListItem(),

            RecentPostItem(),

                Column(
                children: [

                    // AdmobBanner(adUnitId: AdManager.bannerId, adSize: AdmobBannerSize.BANNER),
                ],
                )

          ],
        ),
    );

  }
}
