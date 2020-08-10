import 'package:flutter/material.dart';
// import 'package:volunteer/imagepick.dart';
import 'package:fyp_cs/arrwk_note.dart';

// void main() => runApp(MaterialApp(
//       home: Welcome(),
//     ));

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      appBar: AppBar(
        title: Text('VoMA'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
            label: Text('Volunteer',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            color: Colors.blue,
            child: Text(
              'Welcome to Volunteer Management App',
              style: TextStyle(
                fontSize: 17.0,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(20.0),
            color: Colors.white70,
            child: Text(
              'Thank you for your unforgettable cooperation in volunteering to teach primary schools with shortage of teachers. By doing so we hope to get good academic performance of students in their examinations.',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Ubuntu',
                // fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(20.0),
            color: Colors.white70,
            child: Text(
              'Help us know that you arrived at school by uploading your arrival note in picture format. sample: an_juma.jpg',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Ubuntu',
                // fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton.icon(
                icon: Icon(Icons.description),
                color: Colors.amber[300],
                //padding: EdgeInsets.all(10.0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PickImage()),
                  );
                },
                label: Text(
                  'Arrival Note',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
