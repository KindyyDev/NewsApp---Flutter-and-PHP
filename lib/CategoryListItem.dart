

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kindyywebapp1/page/CategoryBy.dart';


class CategoryListItem extends StatefulWidget {
  @override
  _CategoryListItemState createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {

  // ignore: deprecated_member_use
  List categories = List();

  Future getAllCategory()async{
    var url = "http://192.168.43.203/kindyywebapp/CategoryAll.php";
    var response = await http.get(url);
    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      setState(() {
          categories = jsonData;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryItem(categoryName: categories[index]["name"],);
          }),
    );
  }
}



class CategoryItem extends StatefulWidget {
  final categoryName;
  CategoryItem({this.categoryName});
  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Text(widget.categoryName,
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryBy(categoryName: widget.categoryName,),),);
          debugPrint(widget.categoryName);
        },
      ),
      ),
    );
  }
}
