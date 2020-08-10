import 'package:flutter/material.dart';
// import 'package:fyp_cs/arrwk_note.dart';
// import 'package:fyp_cs/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fyp_cs/services/auth.dart';
import 'package:fyp_cs/tamiweb.dart';
import 'package:fyp_cs/user_prof.dart';
import 'package:fyp_cs/visual.dart';
import 'package:fyp_cs/wkrport.dart';
// import 'package:fyp_cs/visual.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // elevation: 10.0,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("${user?.displayName}"),
              accountEmail: Text("${user?.email}"),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/tvsbg.jpg"),
                ),
              ),
            ),
            // DrawerHeader(
            // child: Text(
            //   'Volunteering Management App',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 17.0,
            //   ),
            // ),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            // ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Account'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('TAMISEMI updates'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tamisemi()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.insert_chart),
              title: Text('Visualizations'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Visualization()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () async {
                await _auth.signOut();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginPage()),
                // );
              },
            ),
          ],
        ),
      ),
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
              'Help us know your progress at the school by uploading your weekly report in picture format. sample: wk1_juma.jpg',
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
                    MaterialPageRoute(builder: (context) => PickReport()),
                  );
                },
                label: Text(
                  'Weekly Report',
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
