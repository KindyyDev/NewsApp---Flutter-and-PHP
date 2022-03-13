import 'dart:ui';

// import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final title;
  final image;
  final body;
  final author;
  final postDate;
  final image2;
   PostDetails({this.title, this.image, this.body, this.author, this.postDate, this.image2});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"), backgroundColor: Colors.orange,
        elevation: 0.0,
      ),
      body: Container(
        child: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(title, style: TextStyle(fontSize: 25, fontFamily: "Antonio", fontWeight: FontWeight.bold),),
          ),

          SizedBox(height: 22,),

          Container(
            child: Image.network(image,
            //height: 250,
            ),),

          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              body==null ? "" : body,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Antonio",
                  fontWeight: FontWeight.normal),),
          ),

          SizedBox(height: 22,),

          Container(
            child: Image.network(image2),),

          SizedBox(height: 20,),


            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("by "+ author,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Antonio",
                    fontWeight: FontWeight.bold, color: Colors.black,),),
            ),


            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("on "+postDate,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Antonio",
                    fontWeight: FontWeight.bold, color: Colors.black,),),
            ),


          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Comments",
              style: TextStyle(
                fontSize: 25,
                fontFamily: "Antonio",
                fontWeight: FontWeight.bold, color: Colors.black,),),
          ),

          Container(
            child: Column(
            children: <Widget>[
              Padding(
            padding: const EdgeInsets.all(5.0),
              child:
                TextField(
                decoration: InputDecoration(labelText: "Enter your Comment"),
              ),),



              Padding(
                padding: const EdgeInsets.all(5.0),
                child: MaterialButton(child: Text("Submit"), color: Colors.red, onPressed: () {},
                ),
                  ),
            ],
          ),
          ),



        ],
        ),
      ),
    //   bottomNavigationBar: FacebookBannerAd(
    //   bannerSize: BannerSize.STANDARD,
    //   keepAlive: true,
    //   placementId: "37b1da9d-b48c-4103-a393-2e095e734bd6",
    // ),
    );
  }
}
