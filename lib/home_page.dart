import 'dart:collection';

import 'package:flutter/material.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOCAL JSON"),
      ),
      body: Container(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('load_json/person.json'),
          builder: (context, snapshot) {
            var mydata = json.decode(snapshot.data.toString());

            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Name: " + mydata[index]['name']),
                        Text("Age: " + mydata[index]['age']),
                        Text("Height: " + mydata[index]['height']),
                        Text("Gender: " + mydata[index]['gender']),
                      ],
                    ),
                  ),
                );
              },
              itemCount: mydata == null ? 0 : mydata.length,
            );
          },
        ),
      ),
    );
  }
}
