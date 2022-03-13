import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:kindyywebapp1/page/postDetails.dart';

class RecentPostItem extends StatefulWidget {
  @override
  _RecentPostItemState createState() => _RecentPostItemState();
}

class _RecentPostItemState extends State<RecentPostItem> {

  // ignore: deprecated_member_use
  List recentPost = List();

  Future recentPostData()async{
    var url = "http://192.168.43.203/kindyywebapp/postAll.php";
    var response = await http.get(url,headers: {"Accept":"application/json"});
    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      setState(() {
        recentPost =jsonData;
      });
      print(jsonData);
      return jsonData;
    }
    else{
      print("failed to load");
    }

  }

  @override
  void initState() {
    super.initState();
    recentPostData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.50,
      child: ListView.builder(
        itemCount: recentPost.length,
        itemBuilder: (context, index){
          return RecentItem(
            title: recentPost[index]['title'],
            author: recentPost[index]["author"],
            postDate: recentPost[index]["create_date"],
            body: recentPost[index]["body"],
            image: "http://192.168.43.203/kindyywebapp/uploads/${recentPost[index]["image"]}"
          );
        },
        
      ),
    );
  }
}


class RecentItem extends StatefulWidget {
  final id;
  final title;
  final image;
  final author;
  final postDate;
  final body;
  RecentItem({this.id, this.title, this.image, this.author, this.postDate, this.body,});

  @override
  _RecentItemState createState() => _RecentItemState();
}

class _RecentItemState extends State<RecentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[

          Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(
                      child: Container(
                        child: InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostDetails(
                                    title: widget.title,
                                    image: widget.image,
                                    image2: widget.image,
                                    author: widget.author,
                                    body: widget.body,
                                    postDate: widget.postDate,
                                  ),
                                ),
                              );
                              debugPrint(widget.title);
                            },
                            child: Text(widget.title,  overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 20,),
                              ),

                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
          ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              //   child: Text("posted by:" + widget.author, style: TextStyle(color: Colors.green,),),
              // ),
              // // Padding(
              // //   padding: const EdgeInsets.all(0.0),
              // //   child: Row(
              // //     crossAxisAlignment: CrossAxisAlignment.start,
              // //     children: <Widget>[
              //       Padding(
              //         padding: const EdgeInsets.all(0.0),
              //         child: Text("posted on:" + widget.postDate, style: TextStyle(color: Colors.green,),),
              //       ),
              //     ],
              //   ),
              // ),
          ],
          ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Image.network(widget.image, height: 70, width: 70,),
                ),
              ),
      ],
      ),
    );
  }
}

