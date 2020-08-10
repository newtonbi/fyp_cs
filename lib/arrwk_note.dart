import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:fyp_cs/home.dart';
import 'dart:async';


class PickImage extends StatefulWidget {
  PickImage({this.storage});
  final FirebaseStorage storage;
  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File _image;

  Widget build(BuildContext context) {
    Future getImage() async {
      // ignore: deprecated_member_use
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async {
      StorageReference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('arrivalnotes/${Path.basename(_image.path)}');
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print("Arrival Note Uploaded");
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Arrival Note Uploaded')));
      });
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('Upload Document'),
        ),
        body: Builder(
          builder: (context) => Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Color(0xff476cfb),
                        child: ClipOval(
                          child: SizedBox(
                            width: 180.0,
                            height: 180.0,
                            child: (_image != null)
                                ? Image.file(_image, fit: BoxFit.fill)
                                : Image.asset('assets/sample.png'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.camera,
                          size: 30.0,
                        ),
                        onPressed: () {
                          getImage();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Arrival Note',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Document must be in jpg/png format.',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Color(0xff476cfb),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      elevation: 4.0,
                      splashColor: Colors.blueGrey,
                      child: Text('Cancel',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0)),
                    ),
                    RaisedButton(
                      color: Color(0xff476cfb),
                      onPressed: () {
                        uploadPic(context);
                      },
                      elevation: 4.0,
                      splashColor: Colors.blueGrey,
                      child: Text('Submit',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0)),
                    ),
                    RaisedButton(
                      color: Color(0xff476cfb),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      elevation: 4.0,
                      splashColor: Colors.blueGrey,
                      child: Text('Home',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0)),
                    ),
                  ],
                ),
              ])),
        ));
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
