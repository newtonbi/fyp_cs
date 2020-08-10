import 'package:flutter/material.dart';
import 'package:fyp_cs/home.dart';
import 'package:fyp_cs/login.dart';
import 'package:fyp_cs/services/auth.dart';
import 'package:fyp_cs/user_prof.dart';
import 'package:url_launcher/url_launcher.dart';

// void main() => runApp(new Tamisemi());

class Tamisemi extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Volunteering Management App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Visualization()),
                // );
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
        title: Text('TAMISEMI Updates'),
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton.icon(
              onPressed: _initiateURL,
              icon: Icon(Icons.notifications),
              color: Colors.amber,
              label: Text('View TAMISEMI Updates'),
            ),
          ],
        ),
      ),
    );
  }
}

_initiateURL() async {
  const url = 'https://www.tamisemi.go.tz/announcements';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Sorry, We could not launch the URL $url';
  }
}
