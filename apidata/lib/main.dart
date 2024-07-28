import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;

//
void main() {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  @override
  State<myapp> createState() => _MyWidget();
}

class _MyWidget extends State<myapp> {
  late bool isDataLoaded;
  late List user = [];
  @override
  void initState() {
    super.initState();
    isDataLoaded = false;
    function();
  }

  void function() async {
    var response =
        await Http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    print('response status: ${response.statusCode}');
    print('response body: ${response.body}');

    if (response.statusCode == 200) {
      user = json.decode(response.body);
      setState(() {
        isDataLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: isDataLoaded == true
              ? ListView.builder(
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.pink,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user[index]['name'],style: TextStyle(color: Colors.white),),
                            Text(user[index]['thumbnailUrl'.toString()],style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),),
                          ],
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}