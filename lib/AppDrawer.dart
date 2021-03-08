import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _username;
String _useremail;
String _userphotourl;

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    super.initState();
    //setuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(_username != null ? _username : "NO User"),
            accountEmail: Text(
                _useremail != null ? _useremail : "codeplayonapp@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                "P",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text('About Us'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Contact Us'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ));
  }
}

// void setuser() async {
//   final prefs = await SharedPreferences.getInstance();
//   String uid = prefs.getString("userid");
//   if (uid != null || uid.isNotEmpty) {
//     _username = prefs.getString("username");
//     _useremail = prefs.getString("useremail");
//     _userphotourl = prefs.getString("userphotourl");
//   }
//}
