import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

class ProfilePage extends StatefulWidget {
  ProfilePage({this.storage});
  final FirebaseStorage storage;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  File _image;

  @override
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
          .child('profiles/${Path.basename(_image.path)}');
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print("Profile Picture Updated");
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Profile Picture Updated')));
      });
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('Edit Profile'),
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
                                : Image.asset('assets/user.png'),
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
                            // UserAccountsDrawerHeader(
                            //   accountName: Text("${user?.displayName}"),
                            //   accountEmail: Text("${user?.email}"),
                            //   decoration: BoxDecoration(
                            //     image: DecorationImage(
                            //       fit: BoxFit.fill,
                            //       image: AssetImage("assets/tvsbg.jpg"),
                            //     ),
                            //   ),
                            // ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Position',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 15.0),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Primary Teacher',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                child: Icon(
                                  FontAwesomeIcons.user,
                                  color: Color(0xff476cfb),
                                ),
                              ),
                            ),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              //   child: Text(
                              //     'Birthday',
                              //     style: TextStyle(
                              //         color: Colors.blueGrey, fontSize: 10.0),
                              //   ),
                              // ),
                              // Align(
                              //   alignment: Alignment.centerLeft,
                              //   child: Text(
                              //     '1st July 1999',
                              //     style: TextStyle(
                              //         color: Colors.black,
                              //         fontSize: 20.0,
                              //         fontWeight: FontWeight.bold),
                              //   ),
                            ),
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: Container(
                            //     child: Icon(
                            //       FontAwesomeIcons.pen,
                            //       color: Color(0xff476cfb),
                            //     ),
                            //   ),
                            // ),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'School Type',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 15.0),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Primary Government School',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                child: Icon(
                                  FontAwesomeIcons.school,
                                  color: Color(0xff476cfb),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   margin: EdgeInsets.all(20.0),
                //   // child: Row(
                //   //   mainAxisAlignment: MainAxisAlignment.start,
                //   //   children: <Widget>[
                //   //     Text('Email',
                //   //         style: TextStyle(color: Colors.blueGrey, fontSize: 18.0)),
                //   //     SizedBox(width: 20.0),
                //   //     Text('michelle@gmail.com',
                //   //         style: TextStyle(
                //   //             color: Colors.black,
                //   //             fontSize: 20.0,
                //   //             fontWeight: FontWeight.bold)),
                //   //   ],
                //   // ),
                // ),
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
                  ],
                ),
              ])),
        ));
  }
}
