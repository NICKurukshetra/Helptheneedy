import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import './Needy.dart';
import './Donate.dart';
import './Associates.dart';
import './camera.dart';
import 'package:share/share.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

import 'splash.dart';
// ignore: unused_import
// import 'package:flutter_launch/flutter_launch.dart';

//import './Recent.dart';

String _username;
String _useremail;
String _userphotourl;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  // ignore: non_constant_identifier_names
  String ShareText =
      "Welcome to Help the Needy App, Install the app for helping the needy from : https://play.google.com/store/apps/details?id=edapps.com.flutter_tutorials_and_quizzes";
  @override
  void initState() {
    //   _tabController = new TabController(length: 4, initialIndex: 1, vsync: this);

    super.initState();
    setuser();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void launchWhatsApp({
    @required int phone,
    @required String message,
  }) async {
    String url() {
      return "https://wa.me/$phone::/?text=${Uri.parse(message)}";
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('HelpTheNeedy'),
            actions: [
              // action button
              IconButton(
                icon: Icon(Icons.share_rounded),
                onPressed: () {
                  Share.share(ShareText);
                },
              ),
            ],
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.camera_alt_outlined),
                ),
                Tab(text: "Needy"),
                Tab(text: "Donate"),
                Tab(
                  text: "Associates",
                ),
              ],
            ),
          ),
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
                  accountEmail: Text(_useremail != null
                      ? _useremail
                      : "codeplayonapp@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).platform == TargetPlatform.iOS
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
          ),
          body: TabBarView(
            children: [
              Camera(),
              Needy(),
              Donate(),
              Associates(),
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }

  void setuser() async {
    final prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString("userid");
    if (uid != null || uid.isNotEmpty) {
      setState(() {
        _username = prefs.getString("username");
        _useremail = prefs.getString("useremail");
        _userphotourl = prefs.getString("userphotourl");
      });
    }
  }
}

void showdg(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (context) => new AlertDialog(
      title: new Text(title),
      content: Text(message),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pop(); // dismisses only the dialog and returns nothing
          },
          child: new Text('OK'),
        ),
      ],
    ),
  );
}
