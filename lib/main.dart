import 'dart:io';

import 'package:PersonalPost/view_post.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String username;
  String name;
  String postBody;
  String profilepicture;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //File a= ;
    return Scaffold(
        appBar: AppBar(
          title: Text("Personal Post"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Form(
                // key: formkey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Username",
                            border: OutlineInputBorder()),
                        //controller: _emailText,
                        keyboardType: TextInputType.text,
                        onChanged: (s) {
                          username = s;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "name", border: OutlineInputBorder()),
                        //controller: _emailText,
                        keyboardType: TextInputType.text,
                        onChanged: (s) {
                          name = s;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: TextFormField(
                        maxLines: 3,
                        decoration: InputDecoration(
                            labelText: "post body",
                            border: OutlineInputBorder()),
                        //controller: _emailText,
                        keyboardType: TextInputType.text,
                        onChanged: (s) {
                          postBody = s;
                        },
                      ),
                    ),
                    RaisedButton(
                        child: Text(
                          "Pick Image",
                          style: TextStyle(),
                        ),
                        onPressed: () {
                          getImage();
                        }),
                    _image == null
                        ? Text('No image selected.')
                        : Image.file(_image),
                    RaisedButton(
                        child: Text("Submit"),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => Viewpost(
                                      this.name,
                                      this.username,
                                      this.postBody,
                                      this._image,
                                    )),
                          );
                          setState(() {
                            //text = "";
                          });
                        }),
                  ],
                )),
          ],
        )));
  }
}
