import 'package:flutter/material.dart';
import 'package:fyp_cs/welcome.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  String error = '';
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage('assets/tvsbg.jpg'),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                width: 140.0,
                image: new AssetImage('assets/logo.png'),
              ),
              new Text(
                'Volunteer Management App (VoMA)',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              new Form(
                //in the form we have column and in column we have widgets
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0,
                    )),
                  ),

                  // column to a container to give padding
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(10.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 10.0),

                        new TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (val) {
                              setState(() => email = val);
                            }),
                        //SizedBox(height: 20.0),

                        new TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter password",
                            ),
                            keyboardType: TextInputType.text,
                            // hide the text using obscuretext
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            }),

                        new Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                        ),
                        // SizedBox(height: 20.0),

                        RaisedButton.icon(
                          icon: Icon(
                            Icons.directions_walk,
                            color: Colors.black,
                          ),
                          color: Colors.amber[300],
                          //padding: EdgeInsets.all(10.0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Welcome()),
                            );
                          },
                          label: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
