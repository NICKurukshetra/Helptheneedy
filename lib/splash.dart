import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/loginscreen.dart';
import 'package:flutter_application_2/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
    Timer(Duration(seconds: 10), () => checkuser(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color.fromARGB(255, 30, 38, 82),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    "assets/as.png",
                    width: 100,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Help The Needy",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 125.0, bottom: 25.0),
                    color: Colors.transparent,
                    child: new CircularProgressIndicator(
                      backgroundColor: Colors.pinkAccent,
                    )),
                Text(
                  "Please wait..Loading....",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ))));
  }

  void checkuser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString("userid");
    if (uid != null || uid.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Loginpage()),
      );
    }
  }
}
