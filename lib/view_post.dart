import 'dart:io';

import 'package:flutter/material.dart';

class Viewpost extends StatefulWidget {
  // Viewpost({Key key, @required this.value}) : super(key: key);

  String username;
  String name;
  String postBody;
  String profilepicture;
  File _image;

  Viewpost(this.name, this.username, this.postBody, this._image);
  @override
  _ViewpostState createState() =>
      _ViewpostState(this.name, this.username, this.postBody, this._image);
}

class _ViewpostState extends State<Viewpost> {
  String username;
  String name;
  String postBody;
  String profilepicture;
  File s;
  String imagepath;
  _ViewpostState(this.name, this.username, this.postBody, this.s);

  @override
  void initState() {
    // TODO: implement initState
    saveImages(s);
    super.initState();
  }

  @override
  saveImages(s) {
    setState(() {
      imagepath = s.path;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 80.0, 0.0, 0),
                      width: 80.0,
                      height: 80.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: FileImage(File(imagepath)),
                        //child: saveImages(s),
                        // backgroundImage: AssetImage('assets/images/money.png'),
                        // child: Image.asset(
                        //   'assets/images/money.png',
                        //   width: 70,
                        //   height: 70,
                        // ),
                        radius: 100,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(35.0, 60.0, 0.0, 0),
                      child: Column(
                        children: [
                          Text(
                            "$username",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w800),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("$name")),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 60.0, 0.0, 10.0),
                child: Text(
                  "$postBody",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
                ),
              )
            ],
          ),
        ));
  }
}
