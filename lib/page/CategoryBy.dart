import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kindyywebapp1/page/postDetails.dart';

class CategoryBy extends StatefulWidget {
  final categoryName;
  CategoryBy({this.categoryName});


  @override
  _CategoryByState createState() => _CategoryByState();
}

class _CategoryByState extends State<CategoryBy> {

  // ignore: deprecated_member_use
  List categoryByPost = List();

  Future categoryByData()async{
    var url = "http://192.168.43.203/kindyywebapp/categoryByPost.php";
    var response = await http.post(url,body:{"name":widget.categoryName});
    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      
      setState(() {
        categoryByPost = jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    categoryByData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: categoryByPost.length,
            itemBuilder: (context, index){
          return NewPostItem(
            author: categoryByPost[index]["author"],
            body: categoryByPost[index]["body"],
            categoryName: categoryByPost[index]["category_name"],
            comments: categoryByPost[index]["comments"],
            image: "http://192.168.43.203/kindyywebapp/uploads/${categoryByPost[index]["image"]}",
            image2: "http://192.168.43.203/kindyywebapp/uploads/${categoryByPost[index]["image2"]}",
            postDate: categoryByPost[index]["post_date"],
            totalLike: categoryByPost[index]["total_like"],
            createDate: categoryByPost[index]["create_date"],
            title: categoryByPost[index]["title"],);
        }),
      ),
    );
  }
}




class NewPostItem extends StatefulWidget {
  final image;
  final image2;
  final author;
  final postDate;
  final comments;
  final totalLike;
  final title;
  final body;
  final categoryName;
  final createDate;
  NewPostItem({this.image, this.image2, this.author, this.postDate, this.comments, this.totalLike, this.title, this.body, this.categoryName, this.createDate});
  @override
  _NewPostItemState createState() => _NewPostItemState();
}

class _NewPostItemState extends State<NewPostItem> {
  @override
  Widget build(BuildContext context) {
    //first change the "listviewbuilder" in the first class
    //give it a "scrolldirectional" of "axishorizontal"

    //then return the whole of my "stack" here, instead of my "contain".
    //Then give the "contain" which is inside my "stack" a height of 200, width of mediaquery.of(context).size.width,
    //then wrap the "contain" with "padding"


    // TO CHANGE BACK...
    // put my "stack" inside a "contain"
    // below..
    //
    // return Container(
    //       padding: EdgeInsets.all(5), color: Colors.white,
    //       height: 170,
    // child: *Stack(...),*
    //
    // );

    return Container(
      padding: EdgeInsets.all(5), color: Colors.white,
      height: 170,
      child: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
            // gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [Colors.red, Colors.black],
            // ),
          ),
          // color: Colors.white,
        ),
        Positioned(
          top: 30,
          left: 30,
          child: CircleAvatar(
            radius: 20,
            //child: Icon(Icons.person),
            backgroundImage: NetworkImage(widget.image),
          ),
        ),


        Positioned(
          top: 30,
          left: 80,
          child: Text(widget.author, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
        ),


        Positioned(
          top: 30,
          left: 160,
          child: Text(widget.postDate, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
        ),

        Positioned(
          top: 60,
          left: 100,
          child: Icon(Icons.comment, color: Colors.grey,),
        ),

        Positioned(
          top: 63,
          left: 130,
          child: Text(widget.comments, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
        ),

        Positioned(
          top: 60,
          left: 170,
          child: Icon(Icons.label, color: Colors.grey,),
        ),

        Positioned(
          top: 63,
          left: 200,
          child: Text(widget.totalLike, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
        ),

        Positioned(
          top: 100,
          left: 30,
          child: Text(widget.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
        ),

        Positioned(
          top: 130,
          right: 30,
          child: Icon(Icons.arrow_forward, color: Colors.white,),
        ),

        Positioned(
          top: 130,
          right: 60,
          child: InkWell(
            child: Text("Read More",
              style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold,),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetails(
                title: widget.title,
                image: widget.image,
                image2: widget.image2,
                author: widget.author,
                body: widget.body,
                postDate: widget.postDate,

              )));
            },

          ),
        ),

      ],
      ),
    );

  }
}