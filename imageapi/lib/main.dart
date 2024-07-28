import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:imageapi/class/image.dart';
import 'package:imageapi/gridview.dart';
import 'package:imageapi/loadingbar.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
       body: Mywidget()
        ),));
}
class Mywidget extends StatefulWidget {
  const Mywidget({super.key});

  @override
  State<Mywidget> createState() => MywidgetState();
}

 class MywidgetState extends State<Mywidget> {
  
  bool isDataLoaded = false;
  get libhttp => null;
  late List<images> image =[];

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  void fetchData() async{
    Uri  apiuri =Uri.parse("https://jsonplaceholder.typicode.com/photos");
     var response =await libhttp.get(apiuri); 
  
    if (response.statusCode == 200) {
      List datalist = json.decode(response.body);
     datalist.forEach((image) {
      image.add(images(title: image("title"), thumbnailUrl: image("thumbnailUrl")));

     });
     setState(() {
       isDataLoaded=true;
     });
  }
  
  @override
  Widget build(BuildContext context) {
    if(isDataLoaded==true){
         return Grid(datalist: image,);
    }
    else{
      return LoadingBar();
    }
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}