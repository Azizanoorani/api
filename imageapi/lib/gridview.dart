import 'package:flutter/material.dart';
import 'package:imageapi/class/image.dart';

class Grid extends StatelessWidget {
  final List<images> datalist; 
  const Grid({super.key, required this.datalist});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: 
    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
    itemCount:datalist.length ,
    itemBuilder: (context,index)=>Card(
      child: Column(
        children: [Image.network(datalist[index].thumbnailUrl),Text(datalist[index].title)],
      ),
    )
    ,);
  }
}